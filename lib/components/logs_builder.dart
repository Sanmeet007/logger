import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:logger/components/divider.dart';
import 'package:logger/components/log_entry.dart';
import 'package:logger/utils/utils.dart';

class GroupedLogsBuilder extends StatelessWidget {
  final List<CallLogEntry> entries;
  final String formattedDate;
  const GroupedLogsBuilder(
      {super.key, required this.entries, required this.formattedDate});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: entries.length,
        itemBuilder: (context, entryIndex) {
          var entry = entries.elementAt(entryIndex);

          String name = entry.name ?? "Unknown";
          if (name == "") name = "Unknown";
          String phoneAccountId = entry.phoneAccountId ?? "Unknown";

          String sim = entry.simDisplayName ?? "Unknown";
          int duration = entry.duration ?? 0;
          int timestamp = entry.timestamp ?? 1;

          String timeString = formatTimeFromTimeStamp(
            context: context,
            timestamp: timestamp,
          );

          String phoneNumber = entry.number ?? "n/a";

          var details =
              getCallDisplayFields(entry.callType ?? CallType.unknown);
          Color callColor = details[0];
          IconData callIcon = details[1];
          String callType = details[2];

          int index = entries.indexOf(entry);

          return Column(
            children: [
              if (index != 0) const LogDivider(),
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
