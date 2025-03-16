import 'package:flutter/material.dart';
import 'package:logger/components/common/divider.dart';
import 'package:logger/utils/native_methods.dart';
import 'package:logger/utils/csv_to_map.dart';
import 'package:logger/utils/snackbar.dart';
import 'package:shared_storage/shared_storage.dart';
import 'dart:async';

import 'fragments/export_filename_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  final void Function({String waitingMessage}) showLinearProgressLoader;
  final void Function() hideLinearProgressLoader;
  final Future<void> Function()? refresher;

  final bool initialDurationFilteringState;
  final bool initialConfirmBeforeDownloadState;
  final bool intialCallLogCountVisibility;
  final bool initialSharingState;
  final String initialImportTypeState;
  final String initialExportedFilenameFormatState;
  final bool initialShowTotalCallDuration;
  final bool initialPhoneAccountIdFilteringState;
  final Function showLoader, hideLoader;
  final Future<bool?> Function(bool) setCallLogCountVisibility;
  final Future<bool?> Function(bool) setShowTotalCallDuration;
  final Future<bool?> Function(bool) setDurationFilteringState;
  final Future<bool?> Function(bool) setPhoneAccountIdFilteringState;
  final Future<bool?> Function(bool) setConfirmBeforeDownloadingState;
  final Future<bool?> Function(bool) setShareButtonState;
  final Future<bool?> Function(String) setCurrentImportType;
  final Future<bool?> Function(String) setCurrentExportedFilenameFormatType;

  const SettingsScreen({
    super.key,
    required this.initialPhoneAccountIdFilteringState,
    required this.setPhoneAccountIdFilteringState,
    required this.setShowTotalCallDuration,
    required this.initialShowTotalCallDuration,
    required this.hideLinearProgressLoader,
    required this.showLinearProgressLoader,
    required this.initialDurationFilteringState,
    required this.initialConfirmBeforeDownloadState,
    required this.initialSharingState,
    required this.setDurationFilteringState,
    required this.setConfirmBeforeDownloadingState,
    required this.setShareButtonState,
    required this.initialImportTypeState,
    required this.setCurrentImportType,
    required this.initialExportedFilenameFormatState,
    required this.setCurrentExportedFilenameFormatType,
    required this.setCallLogCountVisibility,
    required this.intialCallLogCountVisibility,
    required this.hideLoader,
    required this.showLoader,
    this.refresher,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  void openFileNameSettingsSheet() {
    showModalBottomSheet(
        showDragHandle: true,
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return ExportFilenameDialog(
            context: context,
            setCurrentExportedFilenameFormatType:
                widget.setCurrentExportedFilenameFormatType,
            initialExportedFilenameFormatState:
                widget.initialExportedFilenameFormatState,
            showLoader: widget.showLoader,
            hideLoader: widget.hideLoader,
          );
        });
  }

  void handleCallLogImport() async {
    bool isDone = false;
    try {
      var uris = await openDocument(mimeType: 'text/comma-separated-values');
      if (uris != null) {
        var uri = uris.first;
        var fileContents = await getDocumentContent(uri);
        if (fileContents == null) return;
        if (mounted) {
          widget.showLinearProgressLoader(
            waitingMessage: AppLocalizations.of(context).processingFileText,
          );
        }

        var callLogs = await CsvToMapConverter.generateCsvMap(fileContents);

        if (mounted) {
          widget.showLinearProgressLoader(
            waitingMessage: AppLocalizations.of(context).insertingLogsText,
          );
        }
        Future.delayed(const Duration(seconds: 12), () {
          if (!isDone && mounted) {
            widget.showLinearProgressLoader(
              waitingMessage: AppLocalizations.of(context).takingMoreTimeText,
            );
          }
        });
        Future.delayed(const Duration(seconds: 20), () {
          if (!isDone && mounted) {
            widget.showLinearProgressLoader(
              waitingMessage: AppLocalizations.of(context).pleaseWaitText,
            );
          }
        });

        var x = await CallLogWriter.batchInsertCallLogs(callLogs);

        if (mounted) {
          if (x) {
            AppSnackBar.show(
              context,
              content: AppLocalizations.of(context).importSuccessMessageText,
              useAction: true,
              buttonOnPressed: () {
                widget.refresher?.call();
              },
              buttonText: AppLocalizations.of(context).refreshText,
            );
          } else {
            AppSnackBar.show(
              context,
              content: AppLocalizations.of(context).baseGhostErrorMessage,
            );
          }
          isDone = true;
          widget.hideLinearProgressLoader();
        }
      }
    } catch (e) {
      // debugPrint(e.toString());
      isDone = true;
      widget.hideLinearProgressLoader();
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
                          value: widget.initialSharingState,
                          onChanged: (bool newState) async {
                            widget.showLoader();
                            try {
                              await Future.delayed(const Duration(seconds: 2));
                              var r =
                                  await widget.setShareButtonState(newState);
                              if (r == null || !r) {
                                if (context.mounted) {
                                  AppSnackBar.show(
                                    context,
                                    content: AppLocalizations.of(context)
                                        .failedToUpdateSettingsText,
                                  );
                                }
                              } else {
                                if (context.mounted) {
                                  AppSnackBar.show(
                                    context,
                                    content: AppLocalizations.of(context)
                                        .shareSettingUpdateSuccessMsgText,
                                  );
                                }
                              }
                            } catch (_) {
                              if (context.mounted) {
                                AppSnackBar.show(
                                  context,
                                  content: AppLocalizations.of(context)
                                      .failedToUpdateSettingsText,
                                );
                              }
                            } finally {
                              widget.hideLoader();
                            }
                          },
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
                          value: widget.initialConfirmBeforeDownloadState,
                          onChanged: (bool newState) async {
                            widget.showLoader();
                            try {
                              await Future.delayed(const Duration(seconds: 2));
                              var r = await widget
                                  .setConfirmBeforeDownloadingState(newState);
                              if (r == null || !r) {
                                if (context.mounted) {
                                  AppSnackBar.show(
                                    context,
                                    content: AppLocalizations.of(context)
                                        .failedToUpdateSettingsText,
                                  );
                                }
                              } else {
                                if (context.mounted) {
                                  AppSnackBar.show(
                                    context,
                                    content: AppLocalizations.of(context)
                                        .downloadSettingUpdatedSuccessMsgText,
                                  );
                                }
                              }
                            } catch (_) {
                              if (context.mounted) {
                                AppSnackBar.show(
                                  context,
                                  content: AppLocalizations.of(context)
                                      .failedToUpdateSettingsText,
                                );
                              }
                            } finally {
                              widget.hideLoader();
                            }
                          },
                        ),
                      ],
                    ),
                    const LogDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LinedText(
                            text: AppLocalizations.of(context)
                                .enableCallLogCountVisibilityText),
                        Switch(
                          value: widget.intialCallLogCountVisibility,
                          onChanged: (bool newState) async {
                            widget.showLoader();
                            try {
                              await Future.delayed(const Duration(seconds: 2));
                              var r = await widget
                                  .setCallLogCountVisibility(newState);
                              if (r == null || !r) {
                                if (context.mounted) {
                                  AppSnackBar.show(context,
                                      content: AppLocalizations.of(context)
                                          .failedToUpdateSettingsText);
                                }
                              } else {
                                if (context.mounted) {
                                  AppSnackBar.show(
                                    context,
                                    content: AppLocalizations.of(context)
                                        .settingUpdateSuccessMsgText,
                                  );
                                }
                              }
                            } catch (_) {
                              if (context.mounted) {
                                AppSnackBar.show(
                                  context,
                                  content: AppLocalizations.of(context)
                                      .failedToUpdateSettingsText,
                                );
                              }
                            } finally {
                              widget.hideLoader();
                            }
                          },
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
                          value: widget.initialDurationFilteringState,
                          onChanged: (bool newState) async {
                            widget.showLoader();
                            try {
                              await Future.delayed(const Duration(seconds: 2));
                              var r = await widget
                                  .setDurationFilteringState(newState);
                              if (r == null || !r) {
                                if (context.mounted) {
                                  AppSnackBar.show(context,
                                      content: AppLocalizations.of(context)
                                          .failedToUpdateSettingsText);
                                }
                              } else {
                                if (context.mounted) {
                                  AppSnackBar.show(
                                    context,
                                    content: AppLocalizations.of(context)
                                        .durationFilterSettingUpdatedSuccessMsgText,
                                  );
                                }
                              }
                            } catch (_) {
                              if (context.mounted) {
                                AppSnackBar.show(
                                  context,
                                  content: AppLocalizations.of(context)
                                      .failedToUpdateSettingsText,
                                );
                              }
                            } finally {
                              widget.hideLoader();
                            }
                          },
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
                          value: widget.initialPhoneAccountIdFilteringState,
                          onChanged: (bool newState) async {
                            widget.showLoader();
                            try {
                              await Future.delayed(const Duration(seconds: 2));
                              var r = await widget
                                  .setPhoneAccountIdFilteringState(newState);
                              if (r == null || !r) {
                                if (context.mounted) {
                                  AppSnackBar.show(
                                    context,
                                    content: AppLocalizations.of(context)
                                        .failedToUpdateSettingsText,
                                  );
                                }
                              } else {
                                if (context.mounted) {
                                  AppSnackBar.show(
                                    context,
                                    content: AppLocalizations.of(context)
                                        .filterByPhoneAccountIdSettingUpdatedSuccessMsgText,
                                  );
                                }
                              }
                            } catch (_) {
                              if (context.mounted) {
                                AppSnackBar.show(
                                  context,
                                  content: AppLocalizations.of(context)
                                      .failedToUpdateSettingsText,
                                );
                              }
                            } finally {
                              widget.hideLoader();
                            }
                          },
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
                          value: widget.initialShowTotalCallDuration,
                          onChanged: (bool newState) async {
                            widget.showLoader();
                            try {
                              await Future.delayed(const Duration(seconds: 2));
                              var r = await widget
                                  .setShowTotalCallDuration(newState);
                              if (r == null || !r) {
                                if (context.mounted) {
                                  AppSnackBar.show(
                                    context,
                                    content: AppLocalizations.of(context)
                                        .failedToUpdateSettingsText,
                                  );
                                }
                              } else {
                                if (context.mounted) {
                                  AppSnackBar.show(
                                    context,
                                    content: AppLocalizations.of(context)
                                        .generalSettingUpdatedSuccessMsgText,
                                  );
                                }
                              }
                            } catch (_) {
                              if (context.mounted) {
                                AppSnackBar.show(
                                  context,
                                  content: AppLocalizations.of(context)
                                      .failedToUpdateSettingsText,
                                );
                              }
                            } finally {
                              widget.hideLoader();
                            }
                          },
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
                            value: widget.initialImportTypeState,
                            items: [
                              ...[
                                "csv",
                                "json",
                              ].map(
                                (item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item.toUpperCase(),
                                  ),
                                ),
                              )
                            ],
                            onChanged: (String? newValue) async {
                              if (newValue == null) return;

                              widget.showLoader();
                              try {
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                var r =
                                    await widget.setCurrentImportType(newValue);
                                if (r == null || !r) {
                                  if (context.mounted) {
                                    AppSnackBar.show(
                                      context,
                                      content: AppLocalizations.of(context)
                                          .failedToUpdateSettingsText,
                                    );
                                  }
                                } else {
                                  if (context.mounted) {
                                    AppSnackBar.show(
                                      context,
                                      content: AppLocalizations.of(context)
                                          .importSettingUpdatedSuccessMsgText,
                                    );
                                  }
                                }
                              } catch (_) {
                                if (context.mounted) {
                                  AppSnackBar.show(
                                    context,
                                    content: AppLocalizations.of(context)
                                        .failedToUpdateSettingsText,
                                  );
                                }
                              } finally {
                                widget.hideLoader();
                              }
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

class LinedText extends StatelessWidget {
  final String text;
  final double fontSize;
  const LinedText({
    required this.text,
    this.fontSize = 16.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
