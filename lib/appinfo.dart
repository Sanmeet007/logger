import 'package:flutter/material.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            SizedBox(
              width: 15.0,
            ),
            Text("App Information"),
          ]),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("""
            This app utilizes temporary storage for generated files, automatically deleting them when you exit. Additionally, you have the option to download call logs to your preferred location on the device. Rest assured, Logger prioritizes your privacy by accessing only call logs and never touching other files on your system.
          """
              .trim()),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("I Understand")),
              )
            ],
          )
        ],
      ),
    );
  }
}
