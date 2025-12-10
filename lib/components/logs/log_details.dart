import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/components/common/divider.dart';
import 'package:logger/providers/log_filters_provider.dart';
import 'package:logger/utils/contact_handler.dart';
import 'package:logger/utils/format_helpers.dart';
import 'package:logger/utils/native_methods.dart';
import 'package:logger/utils/phone_formatter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogDetails extends ConsumerWidget {
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
    required this.photoUri,
    required this.parentRef,
  });

  final String? photoUri;
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
  final WidgetRef parentRef;

  void handleAddToContacts(BuildContext context) async {
    Navigator.pop(context);

    ContactHandler.handleAddToContacts(parentContext, phoneNumber);
  }

  void handleOpenContact(BuildContext context) async {
    ContactHandler.handleOpenContact(parentContext, phoneNumber);
  }

  void handleCopyPhoneNumberToClip() async {
    await Clipboard.setData(ClipboardData(text: phoneNumber));
  }

  void handleQuickFilterCallback(BuildContext context) {
    Navigator.pop(context);
    Future.microtask(() async {
      try {
        await parentRef.read(logsFilterProvider.notifier).filterByPhoneNumber(
              PhoneFormatter.parsePhoneNumber(phoneNumber),
            );
      } catch (e, _) {
        /// Silence is golden
      }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onLongPress: () => handleQuickFilterCallback(context),
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    InkWell(
                      onLongPress: handleCopyPhoneNumberToClip,
                      child: Text(
                        phoneNumber,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    )
                  ],
                ),
                trailing: Icon(
                  callIcon,
                  color: callColor,
                ),
                leading: CircleAvatar(
                  child: photoUri != null
                      ? FutureBuilder(
                          future:
                              NativeMethods.getContactPhotoFromUri(photoUri),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircleAvatar(
                                child: Icon(Icons.person),
                              );
                            }

                            if (!snapshot.hasData || snapshot.data == null) {
                              return const CircleAvatar(
                                child: Icon(Icons.person),
                              );
                            }

                            return CircleAvatar(
                              backgroundImage: MemoryImage(snapshot.data!),
                            );
                          },
                        )
                      : Text(
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
                  color: Theme.of(context).colorScheme.surface,
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
                        FromatHelpers.prettifyDuration(
                            Duration(seconds: duration), context),
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
                          PhoneFormatter.shrinkPhoneAccountID(phoneAccountId),
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
              if (!isUnknown)
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () => handleOpenContact(context),
                        child: Text(
                          AppLocalizations.of(context).viewContactLabel,
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
