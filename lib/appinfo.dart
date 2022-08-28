import 'package:flutter/material.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(Icons.info_outline),
            SizedBox(
              width: 15.0,
            ),
            Text("App Information"),
          ]),
      content: Text("""
      This appilcation has been created for extracting call logs from exsisting log history stored in your phone for the purposes of analysis . None of your call log data will be saved to any remote server. Files generated are saved on your phone and can be located in Download floder in your system. 

      """
          .trim()),
    );
  }
}
