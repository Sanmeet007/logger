import 'package:flutter/material.dart';
import 'package:logger/components/sized_text.dart';

class CallStatsTile extends StatelessWidget {
  final double spacing;
  final List<String> values, labels;
  final List<Icon> icons;
  const CallStatsTile({
    super.key,
    this.spacing = 20.0,
    required this.values,
    required this.labels,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedText(
          "Call Statistics",
          size: 20,
        ),
        SizedBox(
          height: spacing - 5,
        ),
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 1.5,
          shrinkWrap: true,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            ...(values.asMap().entries.map(
              (entry) {
                var label = labels[entry.key];
                var icon = icons[entry.key];
                var value = entry.value;

                return Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(250, 42, 40, 40),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        label,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          icon,
                          Text(
                            value,
                            style: const TextStyle(
                              fontSize: 35.0,
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
