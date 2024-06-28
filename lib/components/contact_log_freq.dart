import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:logger/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactLogFreq extends StatelessWidget {
  final CallLogEntry logDetails;
  final int count;
  const ContactLogFreq({
    super.key,
    required this.logDetails,
    required this.count,
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
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? const Color.fromARGB(255, 60, 60, 60)
                  : Colors.black,
              foregroundColor: Theme.of(context).brightness == Brightness.dark
                  ? const Color.fromARGB(255, 235, 235, 235)
                  : Colors.white,
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
              "${prettifyNumbers(
                count,
              )}x",
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  logDetails.name == null
                      ? "Unknown"
                      : logDetails.name!.isEmpty
                          ? "Unknown"
                          : logDetails.name!,
                ),
                Text(
                  logDetails.number.toString(),
                  style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey
                          : Colors.grey[600]),
                ),
              ],
            )),
      ),
    );
  }
}
