import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:logger/components/contact_log.dart';
import 'package:logger/components/divider.dart';
import 'package:logger/components/sized_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              ? AppLocalizations.of(context).longestCallText
              : entries.length > 4
                  ? AppLocalizations.of(context).topNLongestCalls(5)
                  : AppLocalizations.of(context)
                      .topNLongestCalls(entries.length),
          size: 20.0,
        ),
        SizedBox(
          height: spacing - 5,
        ),
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color.fromARGB(249, 34, 34, 34)
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
