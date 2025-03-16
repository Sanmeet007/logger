import 'package:call_log/call_log.dart';
import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:logger/components/logs/log_details.dart';
import 'package:logger/utils/call_display_helper.dart';
import 'package:logger/utils/format_helpers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactLog extends StatelessWidget {
  final CallLogEntry logDetails;
  const ContactLog({
    super.key,
    required this.logDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Slidable(
        closeOnScroll: true,
        startActionPane: ActionPane(
          extentRatio: 0.6,
          motion: const StretchMotion(),
          children: [
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
                  var uri = Uri.parse("tel:${logDetails.number}");
                  await launchUrl(uri);
                },
                backgroundColor: Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromARGB(255, 60, 60, 60)
                    : Colors.black,
                icon: Icons.call,
                label: AppLocalizations.of(context).callText,
              ),
            ),
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
          ],
        ),
        child: ListTile(
            onTap: () {
              bool isUnknown = true;

              String name = logDetails.name ?? "";
              if (name.isEmpty) {
                isUnknown = true;
                name = AppLocalizations.of(context).unknownText;
              } else {
                isUnknown = false;
              }

              int duration = logDetails.duration ?? 0;
              int timestamp = logDetails.timestamp ?? 1;
              var details = CallDisplayHelper.getCallDisplayFields(
                logDetails.callType ?? CallType.unknown,
                context,
              );

              showModalBottomSheet(
                  showDragHandle: true,
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return LogDetails(
                      parentContext: context,
                      isUnknown: isUnknown,
                      name: name,
                      phoneNumber: logDetails.number ??
                          AppLocalizations.of(context).naText,
                      callIcon: details[1],
                      callColor: details[0],
                      timeString: FromatHelpers.formatTimeFromTimeStamp(
                        timestamp: timestamp,
                        context: context,
                      ),
                      formattedDate: FromatHelpers.formatDateFromTimestamp(
                          timestamp, context),
                      duration: duration,
                      callType: details[2],
                      sim: logDetails.simDisplayName ??
                          AppLocalizations.of(context).unknownText,
                      phoneAccountId: logDetails.phoneAccountId ??
                          AppLocalizations.of(context).unknownText,
                    );
                  });
            },
            minVerticalPadding: 14.0,
            leading: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: CircleAvatar(
                child: logDetails.name != null
                    ? Text(
                        logDetails.name!.isEmpty ? "?" : logDetails.name![0],
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                      )
                    : const Icon(Icons.account_circle),
              ),
            ),
            trailing: Text(
              FromatHelpers.prettifyDuration(
                Duration(seconds: logDetails.duration ?? 0),
                context,
                tersity: DurationTersity.minute,
                upperTersity: DurationTersity.day,
              ),
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    logDetails.name == null
                        ? AppLocalizations.of(context).unknownText
                        : logDetails.name!.isEmpty
                            ? AppLocalizations.of(context).unknownText
                            : logDetails.name!,
                  ),
                ),
                FittedBox(
                  child: Text(
                    logDetails.number.toString(),
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey
                          : Colors.grey[600],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
