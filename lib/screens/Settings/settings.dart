import 'package:flutter/material.dart';
import 'package:logger/utils/call_log_writer.dart';
import 'package:logger/utils/csv_to_map.dart';
import 'package:shared_storage/shared_storage.dart';

class SettingsScreen extends StatefulWidget {
  final void Function({String waitingMessage}) showLinearProgressLoader;
  final void Function() hideLinearProgressLoader;
  final Future<void> Function()? refresher;

  const SettingsScreen({
    super.key,
    required this.hideLinearProgressLoader,
    required this.showLinearProgressLoader,
    this.refresher,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  void showSnackBar({
    required String content,
    String? buttonText,
    Function? buttonOnPressed,
    bool useAction = false,
    bool showCloseIcon = true,
  }) {
    if (useAction) {
      if (buttonText == null || buttonOnPressed == null) {
        throw Exception(
            "With useAction param as true buttonText and buttonOnPressed are required");
      }
    }
    final snackbar = SnackBar(
      content: Text(content),
      duration: const Duration(seconds: 4),
      action: useAction
          ? SnackBarAction(
              backgroundColor: const Color.fromARGB(255, 203, 169, 255),
              textColor: const Color.fromARGB(255, 11, 1, 26),
              // backgroundColor: const Color.fromARGB(255, 106, 26, 227),
              // textColor: const Color.fromARGB(255, 255, 255, 255),
              label: buttonText!,
              onPressed: () => buttonOnPressed!(),
            )
          : null,
      showCloseIcon: showCloseIcon,
      closeIconColor: Colors.white,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void handleCallLogImport() async {
    bool isDone = false;
    try {
      var uris = await openDocument(mimeType: 'text/comma-separated-values');
      if (uris != null) {
        var uri = uris.first;
        var fileContents = await getDocumentContent(uri);
        if (fileContents == null) return;
        widget.showLinearProgressLoader(waitingMessage: "Processing file");

        var callLogs = await CsvToMapConverter.generateCsvMap(fileContents);

        widget.showLinearProgressLoader(waitingMessage: "Inserting logs");
        Future.delayed(const Duration(seconds: 12), () {
          if (!isDone) {
            widget.showLinearProgressLoader(
                waitingMessage: "This may take longer");
          }
        });
        Future.delayed(const Duration(seconds: 20), () {
          if (!isDone) {
            widget.showLinearProgressLoader(waitingMessage: "Please wait");
          }
        });

        var x = await CallLogWriter.batchInsertCallLogs(callLogs);

        if (x) {
          showSnackBar(
            content: "Call logs extracted successfully",
            useAction: true,
            buttonOnPressed: () {
              widget.refresher?.call();
            },
            buttonText: "Refresh",
          );
        } else {
          showSnackBar(content: "Something went wrong");
        }
        isDone = true;
        widget.hideLinearProgressLoader();
      }
    } catch (e) {
      isDone = true;
      widget.hideLinearProgressLoader();
      showSnackBar(content: "Something went wrong");
      print(e);
    }
  }

  void confirmImport() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Row(children: [
              Icon(Icons.info_outline),
              SizedBox(
                width: 10.0,
              ),
              Text("Confirm Import")
            ]),
            content: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please confirm to import call logs.",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                    """Importing call logs twice can corrupt your current call logs irreversibly. It may overwrite existing data and cause inconsistencies in your call history. Depending on your device, it could also slow down performance or lead to unexpected behavior."""),
              ],
            ),
            actions: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (mounted) {
                    Navigator.pop(context);
                  }
                  handleCallLogImport();
                },
                child: const Text("Continue"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: confirmImport,
          child: const Text("Pick document"),
        ),
      ],
    );
  }
}
