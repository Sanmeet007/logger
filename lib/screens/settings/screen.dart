import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/components/common/divider.dart';
import 'package:logger/components/common/lined_text.dart';
import 'package:logger/providers/call_logs_provider.dart';
import 'package:logger/providers/linear_loader_provider.dart';
import 'package:logger/providers/shared_preferences_providers/call_log_count_provider.dart';
import 'package:logger/providers/shared_preferences_providers/download_confirmation_provider.dart';
import 'package:logger/providers/shared_preferences_providers/duration_filtering_provider.dart';
import 'package:logger/providers/shared_preferences_providers/export_file_name_format_provider.dart';
import 'package:logger/providers/shared_preferences_providers/import_type_provider.dart';
import 'package:logger/providers/shared_preferences_providers/logs_sharing_provider.dart';
import 'package:logger/providers/shared_preferences_providers/phone_account_filtering_provider.dart';
import 'package:logger/providers/shared_preferences_providers/total_call_duration_provider.dart';
import 'package:logger/utils/generate_files.dart';
import 'package:logger/utils/native_methods.dart';
import 'package:logger/utils/csv_to_map.dart';
import 'package:logger/utils/snackbar.dart';
import 'package:shared_storage/shared_storage.dart';
import 'dart:async';

import 'fragments/export_filename_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool isDone = false;

  void openFileNameSettingsSheet() {
    showModalBottomSheet(
        showDragHandle: true,
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return ExportFilenameDialog(
            exportFileNameFormat: ref.read(exportFileNameFormatProvider),
          );
        });
  }

  void handleCallLogImport() async {
    var linearProgressLoader = ref.read(linearLoaderProvider.notifier);
    try {
      var uris = await openDocument(mimeType: 'text/comma-separated-values');
      if (uris != null) {
        var uri = uris.first;
        var fileContents = await getDocumentContent(uri);
        if (fileContents == null) return;
        if (mounted) {
          linearProgressLoader.showLoading(
            AppLocalizations.of(context).processingFileText,
          );
        }

        var callLogs = await CsvToMapConverter.generateCsvMap(fileContents);

        if (mounted) {
          linearProgressLoader.showLoading(
            AppLocalizations.of(context).insertingLogsText,
          );
        }

        Future.delayed(const Duration(seconds: 12), () {
          if (!isDone && mounted) {
            linearProgressLoader.showLoading(
              AppLocalizations.of(context).takingMoreTimeText,
            );
          }
        });

        Future.delayed(const Duration(seconds: 20), () {
          if (!isDone && mounted) {
            linearProgressLoader.showLoading(
              AppLocalizations.of(context).pleaseWaitText,
            );
          }
        });

        var x = await CallLogWriter.batchInsertCallLogs(callLogs);

        // Refresh call logs in background automatically
        await ref.read(callLogsNotifierProvider.notifier).hardRefresh();

        if (mounted) {
          if (x) {
            AppSnackBar.show(
              context,
              content: AppLocalizations.of(context).importSuccessMessageText,
            );
          } else {
            AppSnackBar.show(
              context,
              content: AppLocalizations.of(context).baseGhostErrorMessage,
            );
          }
          isDone = true;
          linearProgressLoader.hideLoading();
        }
      }
    } catch (e) {
      debugPrint(e.toString());

      isDone = true;
      linearProgressLoader.hideLoading();
      if (mounted) {
        AppSnackBar.show(
          context,
          content: AppLocalizations.of(context).baseGhostErrorMessage,
        );
      }
    }
  }

  void confirmImport() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              AppLocalizations.of(context).confirmImportLabelText,
            ),
            content: SingleChildScrollView(
              child: Text(
                AppLocalizations.of(context).confirmImportText,
              ),
            ),
            actions: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  AppLocalizations.of(context).cancelText,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (mounted) {
                    Navigator.pop(context);
                  }
                  handleCallLogImport();
                },
                child: Text(
                  AppLocalizations.of(context).continueText,
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context).baseSettingsLabelText,
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(249, 34, 34, 34)
                      : const Color.fromARGB(255, 249, 245, 255),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LinedText(
                          text: AppLocalizations.of(context)
                              .disableLogsSharingText,
                        ),
                        Switch(
                          value: ref.watch(logsSharingProvider),
                          onChanged: (_) =>
                              ref.read(logsSharingProvider.notifier).toggle(),
                        ),
                      ],
                    ),
                    const LogDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LinedText(
                          text: AppLocalizations.of(context)
                              .enableDownloadConfirmationText,
                        ),
                        Switch(
                          value: ref.watch(downloadConfirmationProvider),
                          onChanged: (bool newState) => ref
                              .read(downloadConfirmationProvider.notifier)
                              .toggle(),
                        ),
                      ],
                    ),
                    const LogDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LinedText(
                          text: AppLocalizations.of(context)
                              .enableCallLogCountVisibilityText,
                        ),
                        Switch(
                          value: ref.watch(callLogCountProvider),
                          onChanged: (_) =>
                              ref.read(callLogCountProvider.notifier).toggle(),
                        ),
                      ],
                    ),
                    const LogDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LinedText(
                          text: AppLocalizations.of(context)
                              .enableCallDurationFilteringText,
                        ),
                        Switch(
                          value: ref.watch(durationFilteringProvider),
                          onChanged: (_) => ref
                              .read(durationFilteringProvider.notifier)
                              .toggle(),
                        ),
                      ],
                    ),
                    const LogDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LinedText(
                          text: AppLocalizations.of(context)
                              .enableFilterByAccountIdText,
                        ),
                        Switch(
                          value: ref.watch(phoneAccountFilteringProvider),
                          onChanged: (_) => ref
                              .read(phoneAccountFilteringProvider.notifier)
                              .toggle(),
                        ),
                      ],
                    ),
                    const LogDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LinedText(
                          text: AppLocalizations.of(context)
                              .showTotalCallDurationText,
                        ),
                        Switch(
                          value: ref.watch(totalCallDurationProvider),
                          onChanged: (_) => ref
                              .read(totalCallDurationProvider.notifier)
                              .toggle(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                AppLocalizations.of(context).advancedSettingsLabelText,
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 15.0),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(249, 34, 34, 34)
                      : const Color.fromARGB(255, 249, 245, 255),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LinedText(
                          text: AppLocalizations.of(context)
                              .callLogsExportFormatLabelText,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.0,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color.fromARGB(255, 65, 65, 65)
                                  : Colors.black87,
                            ),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: DropdownButton<String>(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 5.0,
                            ),
                            isDense: true,
                            underline: Container(),
                            enableFeedback: true,
                            value: ref.watch(importTypeProvider).name,
                            items: [
                              ...ImportFileType.values.map(
                                (item) => DropdownMenuItem(
                                  value: item.name,
                                  child: Text(
                                    item.name.toUpperCase(),
                                  ),
                                ),
                              )
                            ],
                            onChanged: (String? newValue) {
                              if (newValue == null) return;
                              late ImportFileType t;

                              if (newValue == ImportFileType.json.name) {
                                t = ImportFileType.json;
                              } else {
                                t = ImportFileType.csv;
                              }

                              ref
                                  .read(importTypeProvider.notifier)
                                  .setImportType(t);
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const LogDivider(),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LinedText(
                          text: AppLocalizations.of(context)
                              .exportFileNameFormatLabelText,
                        ),
                        ElevatedButton(
                          onPressed: openFileNameSettingsSheet,
                          child: Text(
                            AppLocalizations.of(context).configureText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const LogDivider(),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LinedText(
                          text: AppLocalizations.of(context).importCallLogsText,
                        ),
                        ElevatedButton(
                          onPressed: confirmImport,
                          child: Text(
                            AppLocalizations.of(context).startImportText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(249, 34, 34, 34)
                      : const Color.fromARGB(255, 249, 245, 255),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  AppLocalizations.of(context).supportedFormatInformation,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
