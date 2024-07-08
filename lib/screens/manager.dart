import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:logger/components/sized_text.dart';
import 'package:logger/screens/ExportInfo/csv_fields.dart';
import 'package:logger/screens/ExportInfo/json_fields.dart';
import 'package:logger/utils/generate_files.dart';
import 'package:share_plus/share_plus.dart';
import "package:shared_storage/shared_storage.dart";
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';

import 'log_filters.dart';

class Screen {
  final String label;
  final IconData icon;
  final IconData? selectedIcon;
  final Widget screen;
  final int index;

  const Screen({
    required this.label,
    required this.icon,
    required this.screen,
    required this.index,
    this.selectedIcon,
  });
}

class ScreenManager extends StatefulWidget {
  final Iterable<CallLogEntry>? logs;
  final List<Screen> items;
  final int initialIndex;
  final Function() removeLogFilters;
  final Function(Map) filterLogs;
  final Map currentFilters;
  final bool areFiltersApplied;

  final bool askForDownloadConfirmation, showSharingButton;
  final String currentImportType;

  const ScreenManager({
    super.key,
    required this.logs,
    required this.currentFilters,
    required this.filterLogs,
    required this.removeLogFilters,
    required this.items,
    required this.areFiltersApplied,
    required this.askForDownloadConfirmation,
    required this.currentImportType,
    required this.showSharingButton,
    this.initialIndex = 0,
  });

  @override
  State<ScreenManager> createState() => _ScreenManagerState();
}

class _ScreenManagerState extends State<ScreenManager> {
  static const fileName = "output";
  late final String fileExtension;

  late int _selectedIndex;
  Uri? currentFilePath;
  bool isTaskRunning = false;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    fileExtension = widget.currentImportType;
  }

  void updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<Uri?> generateLogsFile(Uri parentUri, String filename) async {
    return CallLogsFileGenerator.generateLogsFile(
      parentUri: parentUri,
      filename: filename,
      fileType: fileExtension,
      callLogs: widget.logs,
    );
  }

  Future<bool> addLogsToFile(File file) async {
    return CallLogsFileGenerator.addLogsToFile(
      file: file,
      callLogs: widget.logs,
      fileType: fileExtension,
    );
  }

  void openFile() async {
    if (currentFilePath != null) {
      await openDocumentFile(currentFilePath as Uri);
    }
  }

  void showSnackBar({
    required String content,
    String? buttonText,
    Function? buttonOnPressed,
    bool useAction = false,
    bool showCloseIcon = true,
  }) {
    if (useAction) {
      if (buttonText == null || buttonOnPressed == null) {
        throw Exception(
            "With useAction param as true buttonText and buttonOnPressed are required");
      }
    }
    final snackbar = SnackBar(
      content: Text(content),
      duration: const Duration(seconds: 4),
      action: useAction
          ? SnackBarAction(
              backgroundColor: const Color.fromARGB(255, 203, 169, 255),
              textColor: const Color.fromARGB(255, 11, 1, 26),
              // backgroundColor: const Color.fromARGB(255, 106, 26, 227),
              // textColor: const Color.fromARGB(255, 255, 255, 255),
              label: buttonText!,
              onPressed: () => buttonOnPressed!(),
            )
          : null,
      showCloseIcon: showCloseIcon,
      closeIconColor: Colors.white,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void downloadStatusSnackbar({required status}) {
    switch (status) {
      case "success":
        showSnackBar(
            content: "Call logs extracted and downloaded successfully",
            useAction: true,
            buttonText: "OPEN",
            buttonOnPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              openFile();
            });
        break;
      case "error":
        showSnackBar(
          content: "Error while downloading file !",
        );
        break;
      default:
      // Silenece is golden
    }
  }

  void confirmAndDownload() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const SizedText(
              "Confirm Download",
              size: 20.0,
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                      """Are you sure you want to download your call logs in ${widget.currentImportType.toUpperCase()} format? This action will save your call history to a ${widget.currentImportType.toUpperCase()} file on your device."""),
                ],
              ),
            ),
            actions: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  downloadFile(showStatus: true);
                },
                child: const Text("Continue"),
              ),
            ],
          );
        });
  }

  Future<bool> downloadFile({bool showStatus = false}) async {
    setState(() => isTaskRunning = true);

    final Uri? grantedUri = await openDocumentTree(grantWritePermission: true);

    if (grantedUri != null) {
      var milliseconds = DateTime.now().millisecondsSinceEpoch;
      String filename = "logger-$milliseconds-$fileName.$fileExtension";

      final fileUri = await generateLogsFile(grantedUri, filename);

      if (fileUri != null) {
        currentFilePath = fileUri;
        if (showStatus) downloadStatusSnackbar(status: "success");
        if (showStatus) setState(() => isTaskRunning = false);
        return true;
      } else {
        if (showStatus) downloadStatusSnackbar(status: "error");
        if (showStatus) setState(() => isTaskRunning = false);
        return false;
      }
    } else {
      if (showStatus) {
        showSnackBar(
            content: "Unable to get permissions", showCloseIcon: false);
      }
      setState(() => isTaskRunning = false);
      return false;
    }
  }

  void shareFile() async {
    setState(() {
      isTaskRunning = true;
    });
    var tempDir = await getTemporaryDirectory();

    DateTime now = DateTime.now();
    String suffix = DateFormat('yyyyMMdd').format(now);
    File file = File("${tempDir.path}/logger_${suffix}_output.csv");
    bool fileGenerationSuccess = await addLogsToFile(file);
    String filePath = file.path;

    if (fileGenerationSuccess) {
      await Share.shareXFiles(
        [XFile(filePath)],
        subject: "Call Logs",
        text: "Share call logs file via gmail , whatsapp etc...",
      );
    } else {
      showSnackBar(
          content:
              "An error occured while generating file. Please try again later");
    }

    setState(() {
      isTaskRunning = false;
    });
  }

  void generateAndOpenFile() async {
    setState(() {
      isTaskRunning = true;
    });

    var tempDir = await getTemporaryDirectory();
    DateTime now = DateTime.now();
    String suffix = DateFormat('yyyyMMdd').format(now);
    File file = File("${tempDir.path}/logger_${suffix}_output.csv");

    bool fileGenerationSuccess = await addLogsToFile(file);
    String filePath = file.path;

    setState(() {
      isTaskRunning = false;
    });

    if (fileGenerationSuccess) {
      showSnackBar(content: "Opening file", showCloseIcon: false);
      OpenFile.open(filePath);
    } else {
      showSnackBar(
          content: "Unable to open file please try again later",
          showCloseIcon: false);
    }
  }

  void showFiltersModal() {
    showModalBottomSheet(
      isDismissible: true,
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) => LogFilters(
        currentFilters: widget.currentFilters,
        filterLogs: widget.filterLogs,
        removeFilters: widget.removeLogFilters,
      ),
    );
  }

  void openDetailedView() {
    showModalBottomSheet(
        isDismissible: true,
        isScrollControlled: true,
        showDragHandle: true,
        context: context,
        builder: (context) {
          return DraggableScrollableSheet(
            maxChildSize: 0.9,
            expand: false,
            builder: (context, controller) => SingleChildScrollView(
              controller: controller,
              child: widget.currentImportType == "csv"
                  ? const CsvFieldsInformation()
                  : const JsonFieldsInformation(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex != widget.initialIndex) {
          setState(() {
            _selectedIndex = widget.initialIndex;
          });
          return false;
        }
        return true;
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                title: const Text(
                  "Logger",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  ...(_selectedIndex == 0
                      ? [
                          IconButton(
                            tooltip: "Download",
                            splashRadius: 22.0,
                            icon: const Icon(
                              Icons.file_download_outlined,
                              size: 30.0,
                            ),
                            onPressed: !isTaskRunning
                                ? () => widget.askForDownloadConfirmation
                                    ? confirmAndDownload()
                                    : downloadFile(showStatus: true)
                                : null,
                          ),
                          IconButton(
                            tooltip: "Export Open",
                            splashRadius: 22.0,
                            icon: const Icon(Icons.file_open_outlined),
                            onPressed: !isTaskRunning
                                ? () => generateAndOpenFile()
                                : null,
                          ),
                          if (widget.showSharingButton)
                            IconButton(
                              tooltip: "Share",
                              splashRadius: 22.0,
                              icon: const Icon(Icons.share_rounded),
                              onPressed:
                                  !isTaskRunning ? () => shareFile() : null,
                            ),
                        ]
                      : []),
                  if (_selectedIndex == 1 || _selectedIndex == 0)
                    IconButton(
                      tooltip: "Filter",
                      onPressed: showFiltersModal,
                      icon: widget.areFiltersApplied
                          ? Badge(
                              backgroundColor: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color.fromARGB(255, 196, 169, 255)
                                  : const Color.fromARGB(255, 106, 26, 227),
                              child: const Icon(Icons.filter_alt_rounded),
                            )
                          : const Icon(Icons.filter_alt_rounded),
                    ),
                  if (_selectedIndex == 2)
                    IconButton(
                      tooltip: "Export Fields Info",
                      onPressed: openDetailedView,
                      icon: const Icon(Icons.file_present_outlined),
                    ),
                  const SizedBox(
                    width: 10.0,
                  )
                ]),
            bottomNavigationBar: NavigationBar(
              indicatorColor: const Color.fromARGB(217, 223, 202, 255),
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              selectedIndex: _selectedIndex,
              destinations: widget.items
                  .map(
                    (item) => NavigationDestination(
                      icon: Icon(item.icon),
                      selectedIcon: Icon(item.selectedIcon),
                      label: item.label,
                    ),
                  )
                  .toList(),
            ),
            body: IndexedStack(
              index: _selectedIndex,
              children: [...widget.items.map((e) => e.screen)],
            ),
          ),
          if (isTaskRunning)
            Container(
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? Colors.black54
                      : Colors.white54,
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
