import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
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

  const ScreenManager({
    super.key,
    required this.logs,
    required this.currentFilters,
    required this.filterLogs,
    required this.removeLogFilters,
    required this.items,
    required this.areFiltersApplied,
    this.initialIndex = 0,
  });

  @override
  State<ScreenManager> createState() => _ScreenManagerState();
}

class _ScreenManagerState extends State<ScreenManager> {
  final fileNameWithExtension = "output.csv";
  late int _selectedIndex;
  Uri? currentFilePath;
  bool isTaskRunnig = false;

  @override
  void initState() {
    _selectedIndex = widget.initialIndex;
    super.initState();
  }

  void updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<bool> generateLogsFile(Uri parentUri, String filename) async {
    String contents = "";
    try {
      // Labels
      contents +=
          "name,duration,number,phone_account_id,call_type,formattedNumber,sim_display_name,timestamp,cached_number_label,cached_number_type,cached_matched_number\n";

      if (widget.logs != null) {
        contents += widget.logs!
            .map((entry) =>
                "${entry.name},${entry.duration},${entry.number},${entry.phoneAccountId},${entry.callType},${entry.formattedNumber},${entry.simDisplayName},${entry.timestamp},${entry.cachedNumberLabel},${entry.cachedNumberType},${entry.cachedMatchedNumber}")
            .toList()
            .join("\n");

        DocumentFile? file = await createFileAsString(
          parentUri,
          mimeType: "text/csv",
          displayName: filename,
          content: contents,
        );
        if (file != null) {
          currentFilePath = file.uri;
        }
        return file != null;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> addLogsToFile(File file) async {
    String contents = "";
    try {
      // Labels
      contents +=
          "name,duration,number,phone_account_id,call_type,formattedNumber,sim_display_name,timestamp,cached_number_label,cached_number_type,cached_matched_number\n";

      if (widget.logs != null) {
        contents += widget.logs!
            .map((entry) =>
                "${entry.name},${entry.duration},${entry.number},${entry.phoneAccountId},${entry.callType},${entry.formattedNumber},${entry.simDisplayName},${entry.timestamp},${entry.cachedNumberLabel},${entry.cachedNumberType},${entry.cachedMatchedNumber}")
            .toList()
            .join("\n");

        file.writeAsStringSync(contents);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
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

  Future<bool> downloadFile({bool showStatus = false}) async {
    setState(() => isTaskRunnig = true);

    final Uri? grantedUri = await openDocumentTree(grantWritePermission: true);

    if (grantedUri != null) {
      var milliseconds = DateTime.now().millisecondsSinceEpoch;
      String filename = "logger-$milliseconds-$fileNameWithExtension";

      bool fileStatus = await generateLogsFile(grantedUri, filename);

      if (fileStatus) {
        if (showStatus) downloadStatusSnackbar(status: "success");
        if (showStatus) setState(() => isTaskRunnig = false);
        return true;
      } else {
        if (showStatus) downloadStatusSnackbar(status: "error");
        if (showStatus) setState(() => isTaskRunnig = false);
        return false;
      }
    } else {
      if (showStatus) {
        showSnackBar(
            content: "Unable to get permissions", showCloseIcon: false);
      }
      setState(() => isTaskRunnig = false);
      return false;
    }
  }

  void shareFile() async {
    setState(() {
      isTaskRunnig = true;
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
      isTaskRunnig = false;
    });
  }

  void generateAndOpenFile() async {
    setState(() {
      isTaskRunnig = true;
    });

    var tempDir = await getTemporaryDirectory();
    DateTime now = DateTime.now();
    String suffix = DateFormat('yyyyMMdd').format(now);
    File file = File("${tempDir.path}/logger_${suffix}_output.csv");

    bool fileGenerationSuccess = await addLogsToFile(file);
    String filePath = file.path;

    setState(() {
      isTaskRunnig = false;
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
        child: Scaffold(
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
                            onPressed: !isTaskRunnig
                                ? () => downloadFile(showStatus: true)
                                : null,
                          ),
                          IconButton(
                            tooltip: "Export Open",
                            splashRadius: 22.0,
                            icon: const Icon(Icons.file_open_outlined),
                            onPressed: !isTaskRunnig
                                ? () => generateAndOpenFile()
                                : null,
                          ),
                          IconButton(
                            tooltip: "Share",
                            splashRadius: 22.0,
                            icon: const Icon(Icons.share_rounded),
                            onPressed: !isTaskRunnig ? () => shareFile() : null,
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
            )));
  }
}
