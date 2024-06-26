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

    var widgets = entries.map((entry) {
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
        callIcon = Icons.call;
      } else {
        callType = "Unknown";
        callColor = Colors.grey;
        callIcon = Icons.call;
      }

      int index = entries.indexOf(entry);
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
    return Column(
      children: [...widgets],
    );
  }
}
