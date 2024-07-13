import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logger/utils/exported_file_format.dart';
import 'package:logger/utils/snackbar.dart';

class ExportFilenameDialog extends StatefulWidget {
  final Future<bool?> Function(String) setCurrentExportedFilenameFormatType;
  final String initialExportedFilenameFormatState;
  final Function showLoader, hideLoader;
  final BuildContext context;

  const ExportFilenameDialog({
    super.key,
    required this.setCurrentExportedFilenameFormatType,
    required this.initialExportedFilenameFormatState,
    required this.hideLoader,
    required this.showLoader,
    required this.context,
  });

  @override
  State<ExportFilenameDialog> createState() => _ExportFilenameDialogState();
}

class _ExportFilenameDialogState extends State<ExportFilenameDialog> {
  late final TextEditingController _exportedFilenameController;
  bool _isExportedFilenameValid = true;

  @override
  void initState() {
    super.initState();
    _exportedFilenameController = TextEditingController(
      text: widget.initialExportedFilenameFormatState,
    );
  }

  @override
  void dispose() {
    _exportedFilenameController.dispose();
    super.dispose();
  }

  void resetToDefault() {
    _exportedFilenameController.text = ExportedFileFormatHelper.defaultFormat;
  }

  void validateInput(String newState) {
    bool isValid = ExportedFileFormatHelper.validateExportedFormat(newState);
    setState(() {
      _isExportedFilenameValid = isValid;
    });
  }

  void validateAndSave() async {
    String value = _exportedFilenameController.text;
    bool isValid = ExportedFileFormatHelper.validateExportedFormat(value);
    if (isValid) {
      widget.showLoader();
      try {
        Navigator.pop(context);
        await Future.delayed(const Duration(seconds: 2));
        await widget.setCurrentExportedFilenameFormatType(value);
        if (widget.context.mounted) {
          AppSnackBar.show(
            widget.context,
            content: "Export filename updated successfully",
          );
        }
      } catch (_) {
        if (widget.context.mounted) {
          AppSnackBar.show(
            widget.context,
            content: "Unable to save filename setting",
          );
        }
      } finally {
        widget.hideLoader();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        color: Theme.of(context).canvasColor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _exportedFilenameController,
                onChanged: validateInput,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    tooltip: "Reset",
                    icon: const Icon(Icons.restart_alt),
                    onPressed: resetToDefault,
                  ),
                  border: const OutlineInputBorder(),
                  labelText: 'Exported Filename',
                  errorText:
                      _isExportedFilenameValid ? null : "Error invalid format",
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel"),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed:
                          _isExportedFilenameValid ? validateAndSave : null,
                      child: const Text("Apply & Save"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
