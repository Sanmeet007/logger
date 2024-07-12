import 'package:flutter/material.dart';
import 'package:logger/components/divider.dart';
import 'package:logger/utils/call_log_writer.dart';
import 'package:logger/utils/csv_to_map.dart';
import 'package:logger/utils/snackbar.dart';
import 'package:shared_storage/shared_storage.dart';
import 'dart:async';
import 'dart:developer';

import '../../helpers/exported_file_format.dart';

class SettingsScreen extends StatefulWidget {
  final void Function({String waitingMessage}) showLinearProgressLoader;
  final void Function() hideLinearProgressLoader;
  final Future<void> Function()? refresher;

  final bool initialDurationFilteringState;
  final bool initialConfirmBeforeDownloadState;
  final bool initialSharingState;
  final String initialImportTypeState;
  final String initialExportedFilenameFormatState;
  final Function showLoader, hideLoader;
  final Future<bool?> Function(bool) setDurationFilteringState;
  final Future<bool?> Function(bool) setConfirmBeforeDownloadingState;
  final Future<bool?> Function(bool) setShareButtonState;
  final Future<bool?> Function(String) setCurrentImportType;
  final Future<bool?> Function(String) setCurrentExportedFilenameFormatType;

  const SettingsScreen({
    super.key,
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
    required this.hideLoader,
    required this.showLoader,
    this.refresher,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController exportedFilenameController = TextEditingController();
  bool _isExportedFilenameValid = true;
  Timer? _saveThrottler;

  @override
  void initState() {
    super.initState();

    exportedFilenameController.text = widget.initialExportedFilenameFormatState;
    exportedFilenameController.addListener(() {
      if (_saveThrottler?.isActive ?? false) _saveThrottler?.cancel();
      _saveThrottler = Timer(const Duration(milliseconds: 500), () {
        String value = exportedFilenameController.text;
        bool isValid = ExportedFileFormatHelper.validateExportedFormat(value);
        if (isValid) {
          widget.setCurrentExportedFilenameFormatType(value);
        }
        setState(() {
          _isExportedFilenameValid = isValid;
        });
      });
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
        widget.showLinearProgressLoader(waitingMessage: "Processing file");

        var callLogs = await CsvToMapConverter.generateCsvMap(fileContents);

        widget.showLinearProgressLoader(waitingMessage: "Inserting logs");
        Future.delayed(const Duration(seconds: 12), () {
          if (!isDone) {
            widget.showLinearProgressLoader(
                waitingMessage: "This may take longer");
          }
        });
        Future.delayed(const Duration(seconds: 20), () {
          if (!isDone) {
            widget.showLinearProgressLoader(waitingMessage: "Please wait");
          }
        });

        var x = await CallLogWriter.batchInsertCallLogs(callLogs);

        if (mounted) {
          if (x) {
            AppSnackBar.show(
              context,
              content: "Call logs imported successfully",
              useAction: true,
              buttonOnPressed: () {
                widget.refresher?.call();
              },
              buttonText: "Refresh",
            );
          } else {
            AppSnackBar.show(context, content: "Something went wrong");
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
        AppSnackBar.show(context, content: "Something went wrong");
      }
    }
  }

  void confirmImport() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Confirm Import Start"),
            content: const SingleChildScrollView(
              child: Text(
                  """Importing call logs is a significant task that can irreversibly corrupt your current logs, overwrite data, and cause inconsistencies in your history. Please be aware that this process may take some time and could lead to the issues mentioned above. Proceed with caution."""),
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
                  if (mounted) {
                    Navigator.pop(context);
                  }
                  handleCallLogImport();
                },
                child: const Text("Continue"),
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
              const Text(
                "General Settings",
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(249, 35, 34, 34)
                      : const Color.fromARGB(255, 249, 245, 255),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Disable call log sharing",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
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
                                  AppSnackBar.show(context,
                                      content:
                                          "Failed to update settings. Please try again later");
                                }
                              } else {
                                if (context.mounted) {
                                  AppSnackBar.show(context,
                                      content:
                                          "Sharing settings updated successfully.");
                                }
                              }
                            } catch (_) {
                              if (context.mounted) {
                                AppSnackBar.show(context,
                                    content:
                                        "Failed to update settings. Please try again later");
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
                        const Text(
                          "Enable download confirmation",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
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
                                  AppSnackBar.show(context,
                                      content:
                                          "Failed to update settings. Please try again later");
                                }
                              } else {
                                if (context.mounted) {
                                  AppSnackBar.show(context,
                                      content:
                                          "Downloading settings updated successfully.");
                                }
                              }
                            } catch (_) {
                              if (context.mounted) {
                                AppSnackBar.show(context,
                                    content:
                                        "Failed to update settings. Please try again later");
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
                        const Text(
                          "Enable duration filtering",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
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
                                      content:
                                          "Failed to update settings. Please try again later");
                                }
                              } else {
                                if (context.mounted) {
                                  AppSnackBar.show(context,
                                      content:
                                          "Duration filtering settings updated successfully.");
                                }
                              }
                            } catch (_) {
                              if (context.mounted) {
                                AppSnackBar.show(context,
                                    content:
                                        "Failed to update settings. Please try again later");
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
              const Text(
                "Advanced Settings",
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 15.0),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(249, 35, 34, 34)
                      : const Color.fromARGB(255, 249, 245, 255),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Call logs export format",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
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
                                    AppSnackBar.show(context,
                                        content:
                                            "Failed to update settings. Please try again later");
                                  }
                                } else {
                                  if (context.mounted) {
                                    AppSnackBar.show(context,
                                        content:
                                            "Import settings updated successfully.");
                                  }
                                }
                              } catch (_) {
                                if (context.mounted) {
                                  AppSnackBar.show(context,
                                      content:
                                          "Failed to update settings. Please try again later");
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

                    TextFormField(
                      controller: exportedFilenameController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Exported Filename',
                        errorText: _isExportedFilenameValid ? null : "Error invalid strf time format",
                      ),
                    ),
                    const LogDivider(),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Import Your Call Logs",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        ElevatedButton(
                            onPressed: confirmImport,
                            child: const Text(
                              "Start import",
                            )),
                      ],
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
                      ? const Color.fromARGB(249, 35, 34, 34)
                      : const Color.fromARGB(255, 249, 245, 255),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(
                  "Please note: Only CSV format is currently supported for importing call logs.",
                  style: TextStyle(
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
