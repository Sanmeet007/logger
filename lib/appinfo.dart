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
              This application is specifically crafted to extract call logs from your phone's existing log history, enabling thorough analysis. Rest assured, none of your call log data will ever be stored on any remote server. The generated files are securely saved directly onto your phone, conveniently accessible in the Download folder of your system
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
                    child: const Text("OKAY")),
              )
            ],
          )
        ],
      ),
    );
  }
}
