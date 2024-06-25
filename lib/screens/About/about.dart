import 'package:flutter/material.dart';
import 'package:logger/components/sized_text.dart';
import 'package:logger/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedText(
                  "Software Information",
                  size: 25.0,
                ),
                const Spacer(),
                IconButton(
                    iconSize: 30.0,
                    onPressed: () async {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const Dialog(
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircularProgressIndicator(),
                                    SizedBox(
                                      width: 20.0,
                                    ),
                                    Text(
                                      "Opening Support",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });

                      bool launced =
                          await url_launcher.launchUrl(Uri.parse(supportURL()));
                      if (launced) {
                        if (context.mounted) Navigator.of(context).pop();
                      } else {
                        if (context.mounted) Navigator.of(context).pop();
                      }
                    },
                    icon: const Icon(
                      Icons.help,
                    )),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Table(
              border:
                  TableBorder.all(color: const Color.fromARGB(255, 80, 80, 80)),
              children: [
                TableRow(children: [
                  const TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("version"))),
                  TableCell(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(getVersion()))),
                ]),
                TableRow(children: [
                  const TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("platform"))),
                  TableCell(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: isTabView(context)
                              ? const Text("Android Device")
                              : const Text("Android Phone"))),
                ]),
                TableRow(children: [
                  const TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Support Email"))),
                  TableCell(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        url_launcher
                            .launchUrl(Uri.parse("mailto:${supportEmail()}"));
                      },
                      child: Text(
                        supportEmail(),
                      ),
                    ),
                  )),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
