import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/components/common/sized_text.dart';

class TracklistStatsTile extends StatelessWidget {
  final double spacing;
  final List<String> values, labels;
  final List<Icon> icons;
  final bool showTitle;

  const TracklistStatsTile({
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
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: values.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            var label = labels[index];
            var icon = icons[index];
            var value = values[index];

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
                  SizedBox(
                    height: 8.0,
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
                              fontSize: 20.0,
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
        ),
        SizedBox(
          height: spacing,
        ),
      ],
    );
  }
}
