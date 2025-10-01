import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/data/models/tracklist_item.dart';
import 'package:logger/utils/phone_formatter.dart';
import 'package:logger/utils/constants.dart' as constants;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddNewNumberToTrackListDialog extends ConsumerStatefulWidget {
  final List<TrackListItem> currentNumbers;

  const AddNewNumberToTrackListDialog(
      {super.key, required this.currentNumbers});

  @override
  ConsumerState<AddNewNumberToTrackListDialog> createState() =>
      AddNewNumberToTrackListDialogState();
}

class AddNewNumberToTrackListDialogState
    extends ConsumerState<AddNewNumberToTrackListDialog> {
  String? _errorText;
  final _controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).trackContactText),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppLocalizations.of(context).addToTrackList(
                constants.maxAllowedTrackListItems,
              ),
            ),
            SizedBox(height: 16),
            Form(
              key: formKey,
              child: TextFormField(
                autofocus: true,
                controller: _controller,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).trackContactLabelText,
                  hintText: AppLocalizations.of(context).hintMobileNumberText,
                  border: OutlineInputBorder(),
                  errorText: _errorText,
                ),
                onChanged: (value) {
                  if (_errorText != null && value.trim().isEmpty) {
                    setState(() {
                      _errorText = null;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(AppLocalizations.of(context).cancelText),
        ),
        OutlinedButton(
          onPressed: () {
            String value = _controller.text.trim();
            value = PhoneFormatter.parsePhoneNumber(value);

            if (value.isEmpty) {
              setState(() {
                _errorText =
                    AppLocalizations.of(context).emptyPhoneNumberErrorText;
              });
              return;
            }

            final phoneRegEx = RegExp(r'^\+?\d{7,15}$');
            if (!phoneRegEx.hasMatch(value)) {
              setState(() {
                _errorText =
                    AppLocalizations.of(context).invalidNumberErrorText;
              });
              return;
            }

            if (widget.currentNumbers
                .map((e) => e.phoneNumber)
                .contains(value.trim())) {
              setState(() {
                _errorText =
                    AppLocalizations.of(context).numberAlreadyAddedErrorText;
              });
              return;
            }

            Navigator.of(context).pop(value);
          },
          child: Text(
            AppLocalizations.of(context).addText,
          ),
        ),
      ],
    );
  }
}
