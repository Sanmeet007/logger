import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:logger/components/log_details.dart';
import 'package:logger/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

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
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              flex: 1,
              onPressed: (context) async {
                var uri = Uri.parse("tel:${logDetails.number}");
                await launchUrl(uri);
              },
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              icon: Icons.call,
              label: 'Call',
            ),
            SlidableAction(
              flex: 1,
              onPressed: (context) async {
                var uri = Uri.parse("sms:${logDetails.number}");
                await launchUrl(uri);
              },
              backgroundColor: const Color.fromARGB(255, 134, 53, 255),
              foregroundColor: Colors.white,
              icon: Icons.message,
              label: 'SMS',
            ),
          ],
        ),
        child: ListTile(
            onTap: () {
              String name = logDetails.name ?? "Unknown";
              if (name == "") name = "Unknown";
              int duration = logDetails.duration ?? 0;
              int timestamp = logDetails.timestamp ?? 1;
              var details =
                  getCallDisplayFields(logDetails.callType ?? CallType.unknown);

              showModalBottomSheet(
                  showDragHandle: true,
                  context: context,
                  isScrollControlled: true,
                  builder: (context) {
                    return LogDetails(
                      name: logDetails.name ?? "Unknown",
                      phoneNumber: logDetails.number ?? "n/a",
                      callIcon: details[1],
                      callColor: details[0],
                      timeString: formatTimeFromTimeStamp(timestamp),
                      formattedDate: formatDateFromTimestamp(timestamp),
                      duration: duration,
                      callType: details[2],
                      sim: logDetails.simDisplayName ?? "Unknown",
                      phoneAccountId: logDetails.phoneAccountId ?? "Unknown",
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
              prettifyDuration(
                Duration(seconds: logDetails.duration ?? 0),
              ),
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  logDetails.name ?? "Uknown",
                ),
                Text(
                  logDetails.number.toString(),
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            )),
      ),
    );
  }
}
