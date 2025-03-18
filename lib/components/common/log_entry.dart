import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logger/providers/whatsapp_availablity_provider.dart';
import 'package:logger/utils/native_methods.dart';
import 'package:logger/utils/snackbar.dart';
import 'package:logger/utils/whatsapp_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../logs/log_details.dart';

class LogEntry extends ConsumerWidget {
  const LogEntry({
    super.key,
    required this.name,
    required this.callIcon,
    required this.callColor,
    required this.timeString,
    required this.formattedDate,
    required this.duration,
    required this.callType,
    required this.sim,
    required this.phoneAccountId,
    required this.phoneNumber,
    required this.isUnknown,
  });

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

  void openContact(BuildContext context) async {
    bool launchSuccess = await NativeMethods.openContact(phoneNumber);
    if (!launchSuccess) {
      if (context.mounted) {
        AppSnackBar.show(
          context,
          content: AppLocalizations.of(context).errorOpeningContact,
        );
      }
    }
  }

  void addToContact(BuildContext context) async {
    bool launchSuccess = await NativeMethods.addToContacts(phoneNumber);
    if (!launchSuccess) {
      if (context.mounted) {
        AppSnackBar.show(
          context,
          content: AppLocalizations.of(context).addToContactsErrorText,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Slidable(
      closeOnScroll: true,
      startActionPane: ActionPane(
        extentRatio: 1,
        // A motion is a widget used to control how the pane animates.
        motion: const StretchMotion(),
        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          Theme(
            data: Theme.of(context).copyWith(
              outlinedButtonTheme: OutlinedButtonThemeData(
                style: ButtonStyle(
                    iconColor: Theme.of(context).brightness == Brightness.dark
                        ? WidgetStatePropertyAll(
                            Color.fromARGB(255, 235, 235, 235))
                        : WidgetStatePropertyAll(Colors.white)),
              ),
            ),
            child: SlidableAction(
              autoClose: true,
              flex: 1,
              onPressed: (context) async {
                var uri = Uri.parse("tel:$phoneNumber");
                await launchUrl(uri);
              },
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? const Color.fromARGB(255, 60, 60, 60)
                  : Colors.black,
              icon: Icons.call,
              label: 'Call',
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              outlinedButtonTheme: const OutlinedButtonThemeData(
                style: ButtonStyle(
                  iconColor: WidgetStatePropertyAll(Colors.white),
                ),
              ),
            ),
            child: SlidableAction(
              autoClose: true,
              // An action can be bigger than the others.
              flex: 1,
              onPressed: (context) async {
                var uri = Uri.parse("sms:$phoneNumber");
                await launchUrl(uri);
              },
              backgroundColor: const Color.fromARGB(255, 134, 53, 255),
              foregroundColor: Colors.white,
              icon: Icons.message,
              label: 'SMS',
            ),
          ),

          if (ref.watch(whatsappAvailabilityProvider).hasValue &&
              (ref.watch(whatsappAvailabilityProvider).valueOrNull ?? false) ==
                  true)
            Theme(
              data: Theme.of(context).copyWith(
                outlinedButtonTheme: const OutlinedButtonThemeData(
                  style: ButtonStyle(
                    iconColor: WidgetStatePropertyAll(Colors.white),
                  ),
                ),
              ),
              child: SlidableAction(
                autoClose: true,
                // An action can be bigger than the others.
                flex: 1,
                onPressed: (context) async {
                  await openWhatsApp(context, phoneNumber);
                },
                backgroundColor: const Color.fromARGB(255, 37, 211, 102),
                foregroundColor: Colors.white,
                icon: FontAwesomeIcons.whatsapp,
                label: 'WA',
              ),
            ),
        ],
      ),
      child: ListTile(
          onLongPress: () =>
              isUnknown ? addToContact(context) : openContact(context),
          tileColor: Theme.of(context).colorScheme.surface,
          onTap: () {
            showModalBottomSheet(
                showDragHandle: true,
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return LogDetails(
                    parentContext: context,
                    isUnknown: isUnknown,
                    name: name,
                    phoneNumber: phoneNumber,
                    callIcon: callIcon,
                    callColor: callColor,
                    timeString: timeString,
                    formattedDate: formattedDate,
                    duration: duration,
                    callType: callType,
                    sim: sim,
                    phoneAccountId: phoneAccountId,
                  );
                });
          },
          minVerticalPadding: 14.0,
          leading: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Container(
              color: callColor,
              padding: const EdgeInsets.all(8),
              child: Icon(callIcon),
            ),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                timeString,
                style: TextStyle(
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? const Color.fromARGB(255, 206, 206, 206)
                        : const Color.fromARGB(255, 80, 76, 81),
                    fontSize: 14),
              ),
            ],
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(child: Text(name)),
              FittedBox(
                child: Text(
                  phoneNumber,
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey
                        : Colors.grey[600],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
