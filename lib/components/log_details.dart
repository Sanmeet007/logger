import 'package:flutter/material.dart';
import 'package:logger/components/divider.dart';
import 'package:logger/utils/native_methods.dart';
import 'package:logger/utils/snackbar.dart';
import 'package:logger/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogDetails extends StatelessWidget {
  const LogDetails({
    super.key,
    required this.parentContext,
    required this.name,
    required this.phoneNumber,
    required this.callIcon,
    required this.callColor,
    required this.timeString,
    required this.formattedDate,
    required this.duration,
    required this.callType,
    required this.sim,
    required this.phoneAccountId,
    required this.isUnknown,
  });

  final BuildContext parentContext;
  final bool isUnknown;
  final String name;
  final String phoneNumber;
  final IconData callIcon;
  final Color callColor;
  final String timeString;
  final String formattedDate;
  final int duration;
  final String callType;
  final String sim;
  final String phoneAccountId;

  void handleAddToContacts(BuildContext context) async {
    Navigator.pop(context);

    bool launchSuccess = await NativeMethods.addToContacts(phoneNumber);
    if (!launchSuccess) {
      if (parentContext.mounted) {
        AppSnackBar.show(
          parentContext,
          content: AppLocalizations.of(context).addToContactsErrorText,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(12),
          color: Theme.of(context).canvasColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      phoneNumber,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                trailing: Icon(
                  callIcon,
                  color: callColor,
                ),
                leading: CircleAvatar(
                  child: Text(
                    isUnknown ? '?' : name[0],
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black45
                      : const Color.fromARGB(255, 249, 245, 255),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context).timeText,
                        style: const TextStyle(fontSize: 18.0),
                      ),
                      trailing: Text(
                        timeString,
                        style: const TextStyle(fontSize: 15.0),
                      ),
                    ),
                    const LogDivider(),
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context).dateText,
                        style: const TextStyle(fontSize: 18.0),
                      ),
                      trailing: Text(
                        formattedDate,
                        style: const TextStyle(fontSize: 15.0),
                      ),
                    ),
                    const LogDivider(),
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context).durationText,
                        style: const TextStyle(fontSize: 18.0),
                      ),
                      trailing: Text(
                        prettifyDuration(Duration(seconds: duration), context),
                        style: const TextStyle(fontSize: 15.0),
                      ),
                    ),
                    const LogDivider(),
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context).callTypeText,
                        style: const TextStyle(fontSize: 18.0),
                      ),
                      trailing: Text(
                        callType,
                        style: const TextStyle(fontSize: 15.0),
                      ),
                    ),
                    const LogDivider(),
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context).simText,
                        style: const TextStyle(fontSize: 18.0),
                      ),
                      trailing: Text(
                        sim,
                        style: const TextStyle(fontSize: 15.0),
                      ),
                    ),
                    const LogDivider(),
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context).phoneAccountIdText,
                        style: const TextStyle(fontSize: 18.0),
                      ),
                      trailing: FittedBox(
                        child: Text(
                          shrinkPhoneAccountID(phoneAccountId),
                          style: const TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (isUnknown)
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () => handleAddToContacts(context),
                        child: Text(
                          AppLocalizations.of(context).addToContactsText,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          )),
    );
  }
}
