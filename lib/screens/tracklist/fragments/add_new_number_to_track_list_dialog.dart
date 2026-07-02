import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/data/models/tracklist_item.dart';
import 'package:logger/providers/call_logs_provider.dart';
import 'package:logger/utils/constants.dart' as constants;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddNewContactToTrackListDialog extends ConsumerStatefulWidget {
  final List<TrackListItem> currentContacts;

  const AddNewContactToTrackListDialog(
      {super.key, required this.currentContacts});

  @override
  ConsumerState<AddNewContactToTrackListDialog> createState() =>
      _AddNewContactToTrackListDialogState();
}

class _AddNewContactToTrackListDialogState
    extends ConsumerState<AddNewContactToTrackListDialog> {
  String? _errorText;
  String _currentText = '';

  List<String> _getAvailableContactNames() {
    final callLogs = ref.read(callLogsNotifierProvider).value ?? [];
    final trackedNames =
        widget.currentContacts.map((e) => e.contactName).toSet();

    final names = <String>{};
    for (final entry in callLogs) {
      final name = entry.name;
      if (name != null && name.isNotEmpty && !trackedNames.contains(name)) {
        names.add(name);
      }
    }

    final sorted = names.toList()..sort();
    return sorted;
  }

  void _submit(String value) {
    final trimmed = value.trim();

    if (trimmed.isEmpty) {
      setState(() {
        _errorText = AppLocalizations.of(context).emptyPhoneNumberErrorText;
      });
      return;
    }

    if (widget.currentContacts
        .map((e) => e.contactName)
        .contains(trimmed)) {
      setState(() {
        _errorText = AppLocalizations.of(context).numberAlreadyAddedErrorText;
      });
      return;
    }

    Navigator.of(context).pop(trimmed);
  }

  @override
  Widget build(BuildContext context) {
    final availableContacts = _getAvailableContactNames();

    return AlertDialog(
      title: Text(AppLocalizations.of(context).trackContactText),
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context).addToTrackList(
                  constants.maxAllowedTrackListItems,
                ),
              ),
              SizedBox(height: 16),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return availableContacts;
                  }
                  return availableContacts.where((name) => name
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase()));
                },
                onSelected: (String selection) {
                  _currentText = selection;
                },
                fieldViewBuilder: (context, textController, focusNode,
                    onFieldSubmitted) {
                  textController.addListener(() {
                    _currentText = textController.text;
                    if (_errorText != null &&
                        textController.text.trim().isEmpty) {
                      setState(() {
                        _errorText = null;
                      });
                    }
                  });

                  return TextField(
                    controller: textController,
                    focusNode: focusNode,
                    autofocus: true,
                    decoration: InputDecoration(
                      suffixIcon: textController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                textController.clear();
                                _currentText = '';
                              },
                            )
                          : null,
                      labelText:
                          AppLocalizations.of(context).trackContactLabelText,
                      hintText: AppLocalizations.of(context)
                          .trackContactLabelText,
                      border: OutlineInputBorder(),
                      errorText: _errorText,
                    ),
                    onSubmitted: (_) => _submit(textController.text),
                  );
                },
                optionsViewBuilder: (context, onSelected, options) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.circular(8.0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 200,
                          maxWidth:
                              MediaQuery.of(context).size.width * 0.65,
                        ),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: options.length,
                          itemBuilder: (context, index) {
                            final option = options.elementAt(index);
                            return ListTile(
                              dense: true,
                              leading: CircleAvatar(
                                radius: 16,
                                child: Text(
                                  option[0],
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                              title: Text(option),
                              onTap: () => onSelected(option),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(AppLocalizations.of(context).cancelText),
        ),
        OutlinedButton(
          onPressed: () => _submit(_currentText),
          child: Text(
            AppLocalizations.of(context).addText,
          ),
        ),
      ],
    );
  }
}
