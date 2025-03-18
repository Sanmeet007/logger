import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/components/common/divider.dart';
import 'package:logger/providers/call_logs_provider.dart';
import 'package:logger/providers/linear_loader_provider.dart';
import 'package:logger/providers/shared_preferences_providers/call_log_count_provider.dart';
import 'package:logger/providers/shared_preferences_providers/download_confirmation_provider.dart';
import 'package:logger/providers/shared_preferences_providers/duration_filtering_provider.dart';
import 'package:logger/providers/shared_preferences_providers/export_file_name_format_provider.dart';
import 'package:logger/providers/shared_preferences_providers/export_type_provider.dart';
import 'package:logger/providers/shared_preferences_providers/logs_sharing_provider.dart';
import 'package:logger/providers/shared_preferences_providers/phone_account_filtering_provider.dart';
import 'package:logger/providers/shared_preferences_providers/total_call_duration_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/screens/settings/fragments/export_filename_dialog.dart';
import 'package:logger/screens/settings/fragments/export_format_dialog.dart';
import 'package:logger/utils/csv_to_map.dart';
import 'package:logger/utils/native_methods.dart';
import 'package:logger/utils/snackbar.dart';
import 'package:shared_storage/shared_storage.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool isDoneImporting = false;

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
          if (!isDoneImporting && mounted) {
            linearProgressLoader.showLoading(
              AppLocalizations.of(context).takingMoreTimeText,
            );
          }
        });

        Future.delayed(const Duration(seconds: 20), () {
          if (!isDoneImporting && mounted) {
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
          isDoneImporting = true;
          linearProgressLoader.hideLoading();
        }
      }
    } catch (e) {
      debugPrint(e.toString());

      isDoneImporting = true;
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
    final List<Widget> advancedSettingsListItems = <Widget>[
      ListTile(
        onTap: () {
          showModalBottomSheet(
            showDragHandle: true,
            isScrollControlled: true,
            context: context,
            builder: (_) {
              return Wrap(
                children: [
                  ExportFilenameDialog(
                    exportFileNameFormat:
                        ref.read(exportFileNameFormatProvider),
                  ),
                ],
              );
            },
          );
        },
        title: Text(AppLocalizations.of(context).exportFileNameFormatLabelText),
        trailing: Icon(Icons.keyboard_arrow_right_rounded),
      ),
      ListTile(
        onTap: () {
          showModalBottomSheet(
            showDragHandle: true,
            isScrollControlled: true,
            context: context,
            builder: (_) {
              return Wrap(
                children: [
                  ExportFormatDialog(
                    fileType: ref.read(exportTypeProvider),
                  ),
                ],
              );
            },
          );
        },
        title: Text(AppLocalizations.of(context).callLogsExportFormatLabelText),
        trailing: Icon(Icons.keyboard_arrow_right_rounded),
      ),
      ListTile(
        onTap: confirmImport,
        title: Text(AppLocalizations.of(context).importCallLogsText),
        trailing: Icon(Icons.keyboard_arrow_right_rounded),
      ),
    ];

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
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Material(
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      SwitchListTile(
                        value: ref.watch(logsSharingProvider),
                        onChanged: (_) =>
                            ref.read(logsSharingProvider.notifier).toggle(),
                        title: Text(
                          AppLocalizations.of(context).disableLogsSharingText,
                        ),
                      ),
                      const LogDivider(),
                      SwitchListTile(
                        title: Text(
                          AppLocalizations.of(context)
                              .enableDownloadConfirmationText,
                        ),
                        value: ref.watch(downloadConfirmationProvider),
                        onChanged: (bool newState) => ref
                            .read(downloadConfirmationProvider.notifier)
                            .toggle(),
                      ),
                      const LogDivider(),
                      SwitchListTile(
                        title: Text(
                          AppLocalizations.of(context)
                              .enableCallLogCountVisibilityText,
                        ),
                        value: ref.watch(callLogCountProvider),
                        onChanged: (_) =>
                            ref.read(callLogCountProvider.notifier).toggle(),
                      ),
                      const LogDivider(),
                      SwitchListTile(
                        title: Text(
                          AppLocalizations.of(context)
                              .enableCallDurationFilteringText,
                        ),
                        value: ref.watch(durationFilteringProvider),
                        onChanged: (_) => ref
                            .read(durationFilteringProvider.notifier)
                            .toggle(),
                      ),
                      const LogDivider(),
                      SwitchListTile(
                        title: Text(
                          AppLocalizations.of(context)
                              .enableFilterByAccountIdText,
                        ),
                        value: ref.watch(phoneAccountFilteringProvider),
                        onChanged: (_) => ref
                            .read(phoneAccountFilteringProvider.notifier)
                            .toggle(),
                      ),
                      const LogDivider(),
                      SwitchListTile(
                        title: Text(
                          AppLocalizations.of(context)
                              .showTotalCallDurationText,
                        ),
                        value: ref.watch(totalCallDurationProvider),
                        onChanged: (_) => ref
                            .read(totalCallDurationProvider.notifier)
                            .toggle(),
                      ),
                    ],
                  ),
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
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(249, 34, 34, 34)
                      : const Color.fromARGB(255, 249, 245, 255),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Material(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: advancedSettingsListItems.length,
                    itemBuilder: (context, index) {
                      return advancedSettingsListItems[index];
                    },
                    separatorBuilder: (context, index) {
                      return const LogDivider();
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  border: Border.all(
                    width: 1,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color.fromARGB(115, 53, 52, 52)
                        : const Color.fromARGB(255, 249, 245, 255),
                  ),
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
