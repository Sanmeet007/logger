import 'package:flutter/material.dart';
import 'package:logger/components/divider.dart';
import 'package:logger/components/sized_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CallDurationTile extends StatelessWidget {
  final double spacing;
  final List<String> labels;
  final List<String> values;
  const CallDurationTile({
    super.key,
    required this.labels,
    required this.values,
    this.spacing = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedText(
          AppLocalizations.of(context).callDurationText,
          size: 20,
        ),
        SizedBox(
          height: spacing - 5,
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color.fromARGB(249, 34, 34, 34)
                : const Color.fromARGB(155, 240, 230, 255),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: labels.map((String label) {
              final int idx = labels.indexOf(label);

              return Column(
                children: [
                  if (idx != 0) const LogDivider(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 5.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          label,
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          values[idx],
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: spacing,
        ),
      ],
    );
  }
}
