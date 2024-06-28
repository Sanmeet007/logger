import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:logger/components/contact_log.dart';
import 'package:logger/components/divider.dart';
import 'package:logger/components/sized_text.dart';

class TopContactsTile extends StatelessWidget {
  final double spacing;
  final List<CallLogEntry> entries;
  const TopContactsTile({
    super.key,
    required this.entries,
    this.spacing = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedText(
          entries.length < 2
              ? "Longest Call"
              : entries.length > 4
                  ? "Top 5 Longest Calls"
                  : "Top ${entries.length} Longest Calls",
          size: 20.0,
        ),
        SizedBox(
          height: spacing - 5,
        ),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color.fromARGB(250, 42, 40, 40)
                : const Color.fromARGB(155, 240, 230, 255),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              ...(entries.asMap().entries.map(
                (item) {
                  return Column(
                    children: [
                      if (item.key != 0) const LogDivider(),
                      ContactLog(logDetails: item.value),
                    ],
                  );
                },
              )),
            ],
          ),
        )
      ],
    );
  }
}
