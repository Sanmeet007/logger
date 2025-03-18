import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/components/common/sized_text.dart';
import 'package:logger/providers/current_call_logs_provider.dart';
import 'package:logger/providers/log_filters_provider.dart';
import 'package:logger/providers/shared_preferences_providers/download_confirmation_provider.dart';
import 'package:logger/providers/shared_preferences_providers/duration_filtering_provider.dart';
import 'package:logger/providers/shared_preferences_providers/export_file_name_format_provider.dart';
import 'package:logger/providers/shared_preferences_providers/export_type_provider.dart';
import 'package:logger/providers/shared_preferences_providers/logs_sharing_provider.dart';
import 'package:logger/providers/shared_preferences_providers/phone_account_filtering_provider.dart';
import 'package:logger/screens/settings/fragments/export_info/csv_fields.dart';
import 'package:logger/screens/settings/fragments/export_info/json_fields.dart';
import 'package:logger/utils/app_information.dart';
import 'package:logger/utils/file_types.dart';
import 'package:logger/utils/generate_files.dart';
import 'package:logger/utils/snackbar.dart';
import 'package:logger/utils/exported_filename_formatter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_storage/shared_storage.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'log_filters.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

class ScreenManager extends ConsumerStatefulWidget {
  final List<Screen> items;
  final int initialIndex;

  const ScreenManager({
    super.key,
    required this.items,
    this.initialIndex = 0,
  });

  @override
  ConsumerState<ScreenManager> createState() => _ScreenManagerState();
}

class _ScreenManagerState extends ConsumerState<ScreenManager> {
  static const fileName = "output";

  late int _selectedIndex;
  Uri? currentFilePath;
  bool isTaskRunning = false;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
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
      fileType: ref.read(exportTypeProvider),
      callLogs: ref.read(currentCallLogsNotifierProvider),
    );
  }

  Future<bool> addLogsToFile(File file) async {
    return CallLogsFileGenerator.addLogsToFile(
      file: file,
      fileType: ref.read(exportTypeProvider),
      callLogs: ref.read(currentCallLogsNotifierProvider),
    );
  }

  void openFile() async {
    if (currentFilePath != null) {
      await openDocumentFile(currentFilePath as Uri);
    }
  }

  void downloadStatusSnackbar({required status}) {
    switch (status) {
      case "success":
        AppSnackBar.show(context,
            content: AppLocalizations.of(context).callLogsExportSuccessText,
            useAction: true,
            buttonText: AppLocalizations.of(context).openText,
            buttonOnPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          openFile();
        });
        break;
      case "error":
        AppSnackBar.show(
          context,
          content: AppLocalizations.of(context).callLogsExportFailureText,
        );
        break;
      default:
      // DO NOTHING EAT FIVE STAR ¯\_(ツ)_/¯
    }
  }

  void confirmAndDownload() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: SizedText(
              AppLocalizations.of(context).confirmDownloadText,
              size: 20.0,
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context).downloadConfirmationText(
                      ref.read(exportTypeProvider).name,
                    ),
                  )
                ],
              ),
            ),
            actions: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(AppLocalizations.of(context).cancelText),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  downloadFile(showStatus: true);
                },
                child: Text(
                  AppLocalizations.of(context).continueText,
                ),
              ),
            ],
          );
        });
  }

  Future<bool> downloadFile({bool showStatus = false}) async {
    try {
      setState(() => isTaskRunning = true);

      final Uri? grantedUri =
          await openDocumentTree(grantWritePermission: true);

      if (grantedUri != null) {
        FileType currentExportType = ref.read(exportTypeProvider);

        String currentExportedFilenameFormatType =
            ref.read(exportFileNameFormatProvider);

        String filename = ExportedFilenameFormatHelper.createFileFormat(
            currentExportedFilenameFormatType);

        String filenameWithExtension = "$filename.${currentExportType.name}";
        final fileUri =
            await generateLogsFile(grantedUri, filenameWithExtension);

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
          if (mounted) {
            AppSnackBar.show(
              context,
              content: AppLocalizations.of(context).uriPermissionError,
              showCloseIcon: false,
            );
          }
        }
        setState(() => isTaskRunning = false);
        return false;
      }
    } catch (e) {
      if (showStatus) {
        if (mounted) {
          AppSnackBar.show(
            context,
            content: AppLocalizations.of(context).uriPermissionError,
            showCloseIcon: false,
          );
        }
      }
      setState(() => isTaskRunning = false);
      print(e);
      return false;
    }
  }

  void shareFile() async {
    FileType currentExportType = ref.read(exportTypeProvider);

    setState(() {
      isTaskRunning = true;
    });
    var tempDir = await getTemporaryDirectory();

    DateTime now = DateTime.now();
    String suffix = DateFormat('yyyyMMdd').format(now);
    File file = File(
      "${tempDir.path}/logger_${suffix}_$fileName.${currentExportType.name}",
    );
    bool fileGenerationSuccess = await addLogsToFile(file);
    String filePath = file.path;

    if (fileGenerationSuccess && mounted) {
      await Share.shareXFiles(
        [XFile(filePath)],
        subject: AppLocalizations.of(context).fileShareMessage,
        text: AppLocalizations.of(context).fileShareSubject,
      );
    } else {
      if (mounted) {
        AppSnackBar.show(
          context,
          content: AppLocalizations.of(context).fileGenerationError,
        );
      }
    }

    setState(() {
      isTaskRunning = false;
    });
  }

  void generateAndOpenFile() async {
    FileType currentExportType = ref.read(exportTypeProvider);

    setState(() {
      isTaskRunning = true;
    });

    var tempDir = await getTemporaryDirectory();
    DateTime now = DateTime.now();
    String suffix = DateFormat('yyyyMMdd').format(now);
    File file = File(
      "${tempDir.path}/logger_${suffix}_$fileName.${currentExportType.name}",
    );
    bool fileGenerationSuccess = await addLogsToFile(file);
    String filePath = file.path;

    setState(() {
      isTaskRunning = false;
    });

    if (mounted) {
      if (fileGenerationSuccess) {
        AppSnackBar.show(context,
            content: AppLocalizations.of(context).openingFileLabel,
            showCloseIcon: false);
        OpenFile.open(filePath);
      } else {
        AppSnackBar.show(context,
            content: AppLocalizations.of(context).fileOpenError,
            showCloseIcon: false);
      }
    }
  }

  void showFiltersModal() {
    showModalBottomSheet(
      isDismissible: true,
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (context) => LogFilters(
        parentRef: ref,
        availablePhoneAccountIds: ref
            .read(currentCallLogsNotifierProvider.notifier)
            .getAvailablePhoneAccountIds(),
        currentFilters: ref.read(logsFilterProvider).filters,
        canFilterUsingDuration: ref.read(durationFilteringProvider),
        canFilterUsingPhoneAccountId: ref.read(phoneAccountFilteringProvider),
      ),
    );
  }

  void openDetailedView() {
    final currentExportType = ref.read(exportTypeProvider);

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
              child: currentExportType == FileType.csv
                  ? const CsvFieldsInformation()
                  : const JsonFieldsInformation(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _selectedIndex == widget.initialIndex,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) {
          setState(() {
            _selectedIndex = widget.initialIndex;
          });
        }
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                title: FittedBox(
                  child: Text(
                    AppLocalizations.of(context).appTitle,
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                actions: [
                  ...(_selectedIndex == 0
                      ? [
                          IconButton(
                            tooltip: AppLocalizations.of(context).downloadText,
                            splashRadius: 22.0,
                            icon: const Icon(
                              Icons.file_download_outlined,
                              size: 30.0,
                            ),
                            onPressed: !isTaskRunning
                                ? () => ref.watch(downloadConfirmationProvider)
                                    ? confirmAndDownload()
                                    : downloadFile(showStatus: true)
                                : null,
                          ),
                          IconButton(
                            tooltip:
                                AppLocalizations.of(context).exportOpenHintText,
                            splashRadius: 22.0,
                            icon: const Icon(Icons.file_open_outlined),
                            onPressed: !isTaskRunning
                                ? () => generateAndOpenFile()
                                : null,
                          ),
                          if (!ref.watch(logsSharingProvider))
                            IconButton(
                              tooltip: AppLocalizations.of(context).shareText,
                              splashRadius: 22.0,
                              icon: const Icon(Icons.share_rounded),
                              onPressed:
                                  !isTaskRunning ? () => shareFile() : null,
                            ),
                        ]
                      : []),
                  if (_selectedIndex == 1 || _selectedIndex == 0)
                    IconButton(
                      tooltip: AppLocalizations.of(context).filterText,
                      onPressed: showFiltersModal,
                      icon: ref.watch(logsFilterProvider).areFiltersApplied
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
                      tooltip:
                          AppLocalizations.of(context).exportFieldInfoHintText,
                      onPressed: openDetailedView,
                      icon: const Icon(Icons.file_present_outlined),
                    ),
                  if (_selectedIndex == 3)
                    IconButton(
                        tooltip: AppLocalizations.of(context).donateText,
                        onPressed: () {
                          url_launcher
                              .launchUrl(AppInformation.getDonationLink());
                        },
                        icon: const Icon(
                          Icons.handshake,
                        )),
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
                      selectedIcon: Icon(
                        item.selectedIcon,
                        color: Colors.black,
                      ),
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
