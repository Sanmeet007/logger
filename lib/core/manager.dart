import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/components/common/sized_text.dart';
import 'package:logger/data/models/filter_preset.dart';
import 'package:logger/providers/call_logs_provider.dart';
import 'package:logger/providers/current_call_logs_provider.dart';
import 'package:logger/providers/filter_presets_provider.dart';
import 'package:logger/providers/log_filters_provider.dart';
import 'package:logger/providers/shared_preferences_providers/download_confirmation_provider.dart';
import 'package:logger/providers/shared_preferences_providers/duration_filtering_provider.dart';
import 'package:logger/providers/shared_preferences_providers/export_file_name_format_provider.dart';
import 'package:logger/providers/shared_preferences_providers/export_type_provider.dart';
import 'package:logger/providers/shared_preferences_providers/logs_sharing_provider.dart';
import 'package:logger/providers/shared_preferences_providers/phone_account_filtering_provider.dart';
import 'package:logger/providers/shared_preferences_providers/uses_filter_presets_provider.dart';
import 'package:logger/providers/tracklist_provider.dart';
import 'package:logger/screens/settings/fragments/export_info/csv_fields.dart';
import 'package:logger/screens/settings/fragments/export_info/json_fields.dart';
import 'package:logger/screens/tracklist/fragments/add_new_number_to_track_list_dialog.dart';
import 'package:logger/utils/file_types.dart';
import 'package:logger/utils/generate_files.dart';
import 'package:logger/utils/phone_formatter.dart';
import 'package:logger/utils/snackbar.dart';
import 'package:logger/utils/exported_filename_formatter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_storage/shared_storage.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'log_filters.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/utils/constants.dart' as constants;

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
            content: AppLocalizations.of(context).ghostErrorMessage,
            showCloseIcon: false,
          );
        }
      }
      setState(() => isTaskRunning = false);
      return false;
    }
  }

  void shareFile() async {
    try {
      FileType currentExportType = ref.read(exportTypeProvider);

      setState(() {
        isTaskRunning = true;
      });
      var tempDir = await getTemporaryDirectory();

      String currentExportedFilenameFormatType =
          ref.read(exportFileNameFormatProvider);
      String filename = ExportedFilenameFormatHelper.createFileFormat(
          currentExportedFilenameFormatType);
      String filenameWithExtension = "$filename.${currentExportType.name}";
      filenameWithExtension;

      File file = File(
        "${tempDir.path}/$filenameWithExtension",
      );

      bool fileGenerationSuccess = await addLogsToFile(file);
      final XFile shareFile = XFile(file.path);

      if (fileGenerationSuccess && mounted) {
        await Share.shareXFiles(
          [shareFile],
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
    } catch (E) {
      if (mounted) {
        AppSnackBar.show(
          context,
          content: AppLocalizations.of(context).fileGenerationError,
        );
      }
      setState(() {
        isTaskRunning = false;
      });
    }
  }

  void generateAndOpenFile() async {
    FileType currentExportType = ref.read(exportTypeProvider);

    setState(() {
      isTaskRunning = true;
    });

    var tempDir = await getTemporaryDirectory();

    String currentExportedFilenameFormatType =
        ref.read(exportFileNameFormatProvider);
    String filename = ExportedFilenameFormatHelper.createFileFormat(
        currentExportedFilenameFormatType);
    String filenameWithExtension = "$filename.${currentExportType.name}";
    filenameWithExtension;

    File file = File(
      "${tempDir.path}/$filenameWithExtension",
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

  void showFiltersModal() async {
    final usesPrests = ref.read(filterPresetsUsageProvider);

    final availableAccountIds = ref
        .read(callLogsNotifierProvider.notifier)
        .getAvailablePhoneAccountIds();
    final logFiltersState = ref.read(logsFilterProvider);
    final currentFilter = logFiltersState.filter;
    final currentPresetId = logFiltersState.activeFilterId;
    final canFilterUsingDuration = ref.read(durationFilteringProvider);
    final canFilterUsingPhoneAccountId =
        ref.read(phoneAccountFilteringProvider);

    if (usesPrests) {
      final availablePresets = await ref.read(filterPresetsProvider.future);

      if (mounted) {
        showModalBottomSheet(
          isDismissible: true,
          context: context,
          showDragHandle: true,
          isScrollControlled: true,
          builder: (context) => LogFilters(
            parentRef: ref,
            canUsePresets: true,
            initialPresetId: currentPresetId,
            availablePresets: [FilterPreset.defaultPreset, ...availablePresets],
            availablePhoneAccountIds: availableAccountIds,
            currentFilter: currentFilter,
            canFilterUsingDuration: canFilterUsingDuration,
            canFilterUsingPhoneAccountId: canFilterUsingPhoneAccountId,
          ),
        );
      }
    } else {
      if (mounted) {
        showModalBottomSheet(
          isDismissible: true,
          context: context,
          showDragHandle: true,
          isScrollControlled: true,
          builder: (context) => LogFilters(
            parentRef: ref,
            canUsePresets: false,
            availablePresets: [],
            availablePhoneAccountIds: availableAccountIds,
            currentFilter: currentFilter,
            canFilterUsingDuration: canFilterUsingDuration,
            canFilterUsingPhoneAccountId: canFilterUsingPhoneAccountId,
          ),
        );
      }
    }
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

  void registerNewTrackListItem(currentContext) async {
    try {
      String? newNumber = await showAdaptiveDialog<String>(
        context: currentContext,
        builder: (context) {
          return AddNewNumberToTrackListDialog(
            currentNumbers: ref.read(trackListProvider).value ?? [],
          );
        },
      );

      if (newNumber != null) {
        newNumber = PhoneFormatter.parsePhoneNumber(newNumber);

        ref
            .read(trackListProvider.notifier)
            .registerNumberIfNotPresent(newNumber);
      }
    } catch (E) {
      if (mounted) {
        AppSnackBar.show(
          currentContext,
          content: AppLocalizations.of(context).trackNumberErrorText,
        );
      }
    }
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
                  if (_selectedIndex == 1 &&
                      ref.watch(logsFilterProvider).areFiltersApplied)
                    IconButton(
                      tooltip: AppLocalizations.of(context).clearFiltersTooltip,
                      onPressed: () {
                        ref.read(logsFilterProvider.notifier).resetFilters();
                      },
                      icon: const Icon(Icons.filter_alt_off),
                    ),
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
                      tooltip: AppLocalizations.of(context).addText,
                      onPressed:
                          ((ref.watch(trackListProvider).value ?? []).length <
                                  constants.maxAllowedTrackListItems)
                              ? () => registerNewTrackListItem(context)
                              : null,
                      icon: const Icon(Icons.add),
                    ),
                  if (_selectedIndex == 3)
                    IconButton(
                      tooltip:
                          AppLocalizations.of(context).exportFieldInfoHintText,
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
