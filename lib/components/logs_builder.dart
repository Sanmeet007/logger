import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/components/log_entry.dart';

class GroupedLogsBuilder extends StatelessWidget {
  final List<CallLogEntry> entries;
  final String formattedDate;
  const GroupedLogsBuilder(
      {super.key, required this.entries, required this.formattedDate});

  @override
  Widget build(BuildContext context) {
    var timeFormatter = DateFormat('hh:mm a');

    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: entries.length,
        itemBuilder: (context, index) {
          var entry = entries.elementAt(index);

          String name = entry.name ?? "Unknown";
          if (name == "") name = "Unknown";

          String callType = entry.callType.toString();

          String phoneAccountId = entry.phoneAccountId ?? "Unknown";

          String sim = entry.simDisplayName ?? "Unknown";

          int duration = entry.duration ?? 0;
          int timestamp = entry.timestamp ?? 1;
          var date = DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
          String timeString = timeFormatter.format(date);

          String phoneNumber = entry.number ?? "n/a";

          late Color callColor;
          late IconData callIcon;

          if (callType == "CallType.missed") {
            callType = "Missed";
            callColor = Colors.deepOrange;
            callIcon = Icons.call_missed;
          } else if (callType == "CallType.incoming") {
            callType = "Incoming";
            callColor = Colors.blue;
            callIcon = Icons.call_received;
          } else if (callType == "CallType.outgoing") {
            callType = "Outgoing";
            callColor = Colors.green;
            callIcon = Icons.call_made;
          } else if (callType == "CallType.blocked") {
            callType = "Blocked";
            callColor = Colors.red;
            callIcon = Icons.block_flipped;
          } else if (callType == "CallType.rejected") {
            callType = "Rejected";
            callColor = Colors.blueGrey;
            callIcon = Icons.cancel_rounded;
          } else if (callType == "CallType.wifiIncoming") {
            callType = "Wifi Incoming";
            callColor = const Color.fromARGB(255, 110, 113, 255);
            callIcon = Icons.call_received;
          } else if (callType == "CallType.wifiOutgoing") {
            callType = "Wifi Outgoing";
            callColor = const Color.fromARGB(255, 110, 110, 255);
            callIcon = Icons.call_made;
          } else {
            callType = entry.callType.toString().replaceAll("CallType.", "");
            callType =
                "${callType[0].toUpperCase()}${callType.substring(1).toLowerCase()}";
            callColor = Colors.grey;
            callIcon = Icons.call;
          }

          return Column(
            children: [
              if (index != 0)
                Divider(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(255, 30, 30, 30)
                      : const Color.fromARGB(255, 230, 213, 255),
                  height: 1.0,
                ),
              LogEntry(
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
              ),
            ],
          );
        });
  }
}
