import 'package:flutter/material.dart';
import 'package:logger/components/sized_text.dart';
import 'package:logger/utils/analytics_fns.dart';

class CallFreqTile extends StatelessWidget {
  final double spacing;
  final CallLogEntryWithFreq mostFrequent, leastFrequent;

  const CallFreqTile(
      {super.key,
      required this.mostFrequent,
      required this.leastFrequent,
      this.spacing = 20.0});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedText(
          "Call Frequency",
          size: 20.0,
        ),
        SizedBox(
          height: spacing - 5,
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(250, 42, 40, 40),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 5.0,
                ),
                child: Text(
                  "Most Frequently Called Number",
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Divider(
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromARGB(255, 30, 30, 30)
                    : const Color.fromARGB(255, 230, 213, 255),
                height: 1.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 5.0,
                ),
                child: Text(
                  "Least Frequently Called Number",
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: spacing,
        ),
      ],
    );
  }
}
