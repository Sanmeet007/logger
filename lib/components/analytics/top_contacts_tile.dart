import 'package:flutter/material.dart';
import 'package:logger/components/sized_text.dart';

class TopContactsTile extends StatelessWidget {
  final double spacing;
  const TopContactsTile({super.key, this.spacing = 20.0});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedText(
          "Top 5 Contacts by call duration",
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
            children: [
              Row(
                children: [
                  Text("Top  5"),
                ],
              ),
              Row(
                children: [
                  Text("Top  5"),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
