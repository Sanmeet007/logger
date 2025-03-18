import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/components/common/sized_text.dart';

class CallStatsTile extends StatelessWidget {
  final double spacing;
  final List<String> values, labels;
  final List<Icon> icons;
  final bool showTitle;

  const CallStatsTile({
    super.key,
    this.spacing = 20.0,
    required this.values,
    required this.labels,
    required this.icons,
    this.showTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle)
          SizedText(
            AppLocalizations.of(context).callStatsText,
            size: 20,
          ),
        if (showTitle)
          SizedBox(
            height: spacing - 5,
          ),
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio:
              MediaQuery.of(context).size.width <= 350 ? 2.5 : 1.5,
          shrinkWrap: true,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: MediaQuery.of(context).size.width <= 350 ? 1 : 2,
          children: [
            ...(values.asMap().entries.map(
              (entry) {
                var label = labels[entry.key];
                var icon = icons[entry.key];
                var value = entry.value;

                return Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          label,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          icon,
                          Flexible(
                            child: FittedBox(
                              child: Text(
                                value,
                                maxLines: 1,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ))
          ],
        ),
        SizedBox(
          height: spacing,
        ),
      ],
    );
  }
}
