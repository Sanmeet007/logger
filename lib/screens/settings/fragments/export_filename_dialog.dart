import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_preferences_providers/export_file_name_format_provider.dart';
import 'package:logger/screens/settings/fragments/datetime_table.dart';
import 'package:logger/utils/exported_filename_formatter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExportFilenameDialog extends ConsumerStatefulWidget {
  final String exportFileNameFormat;

  const ExportFilenameDialog({
    super.key,
    required this.exportFileNameFormat,
  });

  @override
  ConsumerState<ExportFilenameDialog> createState() =>
      _ExportFilenameDialogState();
}

class _ExportFilenameDialogState extends ConsumerState<ExportFilenameDialog> {
  late final TextEditingController _exportedFilenameController;
  late String initialExportFilenameFormat;
  bool _isExportedFilenameValid = true;

  @override
  void initState() {
    super.initState();

    initialExportFilenameFormat = widget.exportFileNameFormat;
    _exportedFilenameController = TextEditingController(
      text: widget.exportFileNameFormat,
    );
  }

  @override
  void dispose() {
    _exportedFilenameController.dispose();
    super.dispose();
  }

  void resetToDefault() {
    _exportedFilenameController.text =
        ExportedFilenameFormatHelper.defaultFormat;

    setState(() {});
  }

  void validateInput(String newState) {
    bool isValid =
        ExportedFilenameFormatHelper.validateExportedFormat(newState);

    setState(() {
      _isExportedFilenameValid = isValid;
    });
  }

  void validateAndSave() {
    String value = _exportedFilenameController.text;
    bool isValid = ExportedFilenameFormatHelper.validateExportedFormat(value);
    if (isValid) {
      Navigator.pop(context);
      ref.read(exportFileNameFormatProvider.notifier).setFormat(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _exportedFilenameController,
                onChanged: validateInput,
                decoration: InputDecoration(
                  label: Text(
                    AppLocalizations.of(context).filenameFormatLabelText,
                  ),
                  hintText: AppLocalizations.of(context).filenameFormatHintText,
                  suffixIcon: IconButton(
                    tooltip: AppLocalizations.of(context).resetText,
                    icon: const Icon(Icons.restart_alt),
                    onPressed: resetToDefault,
                  ),
                  border: const OutlineInputBorder(),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 66, 66, 66),
                    ),
                  ),
                  errorText:
                      _isExportedFilenameValid ? null : "Error invalid format",
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const DateTimeTable(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        AppLocalizations.of(context).cancelText,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: initialExportFilenameFormat ==
                              _exportedFilenameController.value.text
                          ? null
                          : _isExportedFilenameValid
                              ? validateAndSave
                              : null,
                      child: Text(
                        AppLocalizations.of(context).saveText,
                      ),
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
