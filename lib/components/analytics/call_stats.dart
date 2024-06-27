import 'package:flutter/material.dart';
import 'package:logger/components/sized_text.dart';

class CallStatsTile extends StatelessWidget {
  final double spacing;
  final List<String> values, labels;
  const CallStatsTile({
    super.key,
    this.spacing = 20.0,
    required this.values,
    required this.labels,
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
            ...(Map.fromIterables(labels, values).entries.map(
                  (entry) => Container(
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
                          entry.key,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.call_made),
                            Text(
                              entry.value,
                              style: const TextStyle(
                                fontSize: 35.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
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
