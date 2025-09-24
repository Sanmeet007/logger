import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logger/providers/whatsapp_availablity_provider.dart';
import 'package:logger/utils/call_display_helper.dart';
import 'package:logger/utils/contact_handler.dart';
import 'package:logger/utils/whatsapp_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class GroupedSlidable extends ConsumerWidget {
  final Widget child;
  final CallLogEntry logDetails;

  const GroupedSlidable({
    super.key,
    required this.child,
    required this.logDetails,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onLongPress: () async {
        bool isUnknown = CallDisplayHelper.isUnknownContact(logDetails);
        await HapticFeedback.vibrate();

        if (context.mounted) {
          isUnknown
              ? ContactHandler.handleAddToContacts(context, logDetails.number)
              : ContactHandler.handleOpenContact(context, logDetails.number);
        }
      },
      child: Material(
          color: Colors.transparent,
          child: Slidable(
            closeOnScroll: true,
            startActionPane: ActionPane(
                extentRatio: 0.3,
                motion: const StretchMotion(),
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      outlinedButtonTheme: OutlinedButtonThemeData(
                        style: ButtonStyle(
                            iconColor:
                                Theme.of(context).brightness == Brightness.dark
                                    ? WidgetStatePropertyAll(
                                        Color.fromARGB(255, 235, 235, 235))
                                    : WidgetStatePropertyAll(Colors.white)),
                      ),
                    ),
                    child: SlidableAction(
                      autoClose: true,
                      flex: 1,
                      onPressed: (context) async {
                        // var uri = Uri.parse("tel:${logDetails.number}");
                        // await launchUrl(uri);
                      },
                      backgroundColor:
                          Theme.of(context).brightness == Brightness.dark
                              ? const Color.fromARGB(255, 60, 60, 60)
                              : Colors.black,
                      icon: Icons.call,
                      label: AppLocalizations.of(context).callText,
                    ),
                  ),
                ]),
            endActionPane: ActionPane(
              extentRatio: (logDetails.number != null &&
                      ref.watch(whatsappAvailabilityProvider).hasValue &&
                      (ref.watch(whatsappAvailabilityProvider).valueOrNull ??
                              false) ==
                          true)
                  ? 0.6
                  : 0.3,
              motion: const StretchMotion(),
              children: [
                Theme(
                  data: Theme.of(context).copyWith(
                    outlinedButtonTheme: OutlinedButtonThemeData(
                      style: ButtonStyle(
                        iconColor: WidgetStatePropertyAll(Colors.white),
                      ),
                    ),
                  ),
                  child: SlidableAction(
                    autoClose: true,
                    flex: 1,
                    onPressed: (context) async {
                      var uri = Uri.parse("sms:${logDetails.number}");
                      await launchUrl(uri);
                    },
                    backgroundColor: const Color.fromARGB(255, 134, 53, 255),
                    icon: Icons.message,
                    label: AppLocalizations.of(context).smsText,
                  ),
                ),
                if (logDetails.number != null &&
                    ref.watch(whatsappAvailabilityProvider).hasValue &&
                    (ref.watch(whatsappAvailabilityProvider).valueOrNull ??
                            false) ==
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
                        await openWhatsApp(context, logDetails.number!);
                      },
                      backgroundColor: const Color.fromARGB(255, 37, 211, 102),
                      foregroundColor: Colors.white,
                      icon: FontAwesomeIcons.whatsapp,
                      label: 'WA',
                    ),
                  ),
              ],
            ),
            child: child,
          )),
    );
  }
}
