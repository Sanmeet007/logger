import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/components/common/divider.dart';
import 'package:logger/providers/shared_preferences_providers/export_type_provider.dart';
import 'package:logger/utils/file_types.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExportFormatDialog extends ConsumerStatefulWidget {
  final FileType fileType;
  const ExportFormatDialog({super.key, required this.fileType});

  @override
  ConsumerState<ExportFormatDialog> createState() => _ExportFormatDialogState();
}

class _ExportFormatDialogState extends ConsumerState<ExportFormatDialog> {
  late FileType initialFileType;
  late FileType currentFileType;

  @override
  void initState() {
    initialFileType = widget.fileType;
    currentFileType = widget.fileType;

    super.initState();
  }

  void updateFileTypeAndExit() {
    ref.read(exportTypeProvider.notifier).setExportType(currentFileType);
    setState(() {
      initialFileType = currentFileType;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      color: Theme.of(context).canvasColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromARGB(249, 34, 34, 34)
                    : const Color.fromARGB(255, 249, 245, 255),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Material(
                color: Colors.transparent,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const LogDivider();
                  },
                  itemCount: FileType.values.length,
                  itemBuilder: (context, index) {
                    final t = FileType.values[index];
                    return RadioListTile(
                      title: Text(t.name.toUpperCase()),
                      subtitle: Text(getFileTypeDetails(t)),
                      value: t,
                      groupValue: currentFileType,
                      onChanged: (FileType? value) {
                        if (value == null) return;

                        setState(() {
                          currentFileType = value;
                        });
                      },
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
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
                    onPressed: currentFileType == initialFileType
                        ? null
                        : updateFileTypeAndExit,
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
    );
  }
}
