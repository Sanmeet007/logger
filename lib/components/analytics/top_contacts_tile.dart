import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:logger/components/contact_log.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedText(
          "Top 5 Call Durations",
          size: 20.0,
        ),
        SizedBox(
          height: spacing - 5,
        ),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: const Color.fromARGB(250, 42, 40, 40),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              ...(entries.map((item) => ContactLog(logDetails: item))),
            ],
          ),
        )
      ],
    );
  }
}
