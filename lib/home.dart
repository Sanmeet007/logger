import 'dart:io';
import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'appinfo.dart';
import 'logspage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

class Home extends StatefulWidget {
  final Iterable<CallLogEntry>? entries;
  const Home({
    super.key,
    required this.entries,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String currentFilePath = "";
  bool isTaskRunnig = false;

  @override
  Widget build(BuildContext context) {
    const fileNameWithExtension = "output.csv";

    bool addLogsToFile(File file) {
      String contents = "";
      try {
        // Labels
        contents +=
            "name,duration,number,phone_account_id,call_type,formattedNumber,sim_display_name,timestamp,cached_number_label,cached_number_type,cached_matched_number\n";

        if (widget.entries != null) {
          contents += widget.entries!
              .map((entry) =>
                  "${entry.name},${entry.duration},${entry.number},${entry.phoneAccountId},${entry.callType},${entry.formattedNumber},${entry.simDisplayName},${entry.timestamp},${entry.cachedNumberLabel},${entry.cachedNumberType},${entry.cachedMatchedNumber}")
              .toList()
              .join("\n");
          file.writeAsStringSync(contents);
          return true;
        }
        return false;
      } catch (e) {
        return false;
      }
    }

    void openFile() {
      OpenFile.open(currentFilePath);
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
        duration: const Duration(seconds: 1),
        action: useAction
            ? SnackBarAction(
                backgroundColor: const Color.fromARGB(255, 106, 26, 227),
                textColor: const Color.fromARGB(255, 255, 255, 255),
                label: buttonText!,
                onPressed: () => buttonOnPressed!(),
              )
            : null,
        showCloseIcon: showCloseIcon,
        closeIconColor: Colors.white,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }

    void downloadStatusSnackbar({required status}) {
      switch (status) {
        case "success":
          showSnackBar(
              content: "Call logs extracted and downloaded successfully",
              useAction: true,
              buttonText: "OPEN",
              buttonOnPressed: () {
                openFile();
              });
          break;
        case "error":
          showSnackBar(
            content: "Error while downloading file !",
          );
          break;
        default:
        // Silenece is golden
      }
    }

    Future<bool> downloadFile({bool showStatus = false}) async {
      setState(() => isTaskRunnig = true);
      PermissionStatus permissionState = await Permission.storage.request();
      if (permissionState.isGranted) {
        var downloadDir = "/storage/emulated/0/Download/";
        var milliseconds = DateTime.now().millisecondsSinceEpoch;
        String filePath = "$downloadDir/$milliseconds-$fileNameWithExtension";
        File csvFile = File(filePath);
        bool fileStatus = addLogsToFile(csvFile);
        if (fileStatus) {
          currentFilePath = filePath;
          if (showStatus) downloadStatusSnackbar(status: "success");
          if (showStatus) setState(() => isTaskRunnig = false);
          return true;
        } else {
          if (showStatus) downloadStatusSnackbar(status: "error");
          if (showStatus) setState(() => isTaskRunnig = false);
          return false;
        }
      } else {
        if (showStatus) showSnackBar(content: "Unable to get permissions");
        setState(() => isTaskRunnig = false);
        return false;
      }
    }

    void shareFile() async {
      bool fileGenerationSuccess = await downloadFile(showStatus: false);

      if (fileGenerationSuccess) {
        await Share.shareXFiles(
          [XFile(currentFilePath)],
          subject: "Call Logs",
          text: "Share call logs file via gmail , whatsapp etc...",
        );
      } else {
        showSnackBar(
            content:
                "An error occured while generating file. Please try again later");
      }

      setState(() {
        isTaskRunnig = false;
      });
    }

    void downloadAndOpenFile() async {
      showSnackBar(content: "Opening file", showCloseIcon: false);
      bool isFileDownloaded = await downloadFile(showStatus: false);
      if (isFileDownloaded && currentFilePath != "") {
        OpenFile.open(currentFilePath);
        setState(() => isTaskRunnig = false);
      } else {
        showSnackBar(content: "Unable to open file please try again later");
      }
    }

    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: const Text(
              "LOGGER",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(
                tooltip: "Download",
                splashRadius: 22.0,
                icon: const Icon(
                  Icons.file_download_outlined,
                  size: 30.0,
                ),
                onPressed:
                    !isTaskRunnig ? () => downloadFile(showStatus: true) : null,
              ),
              IconButton(
                tooltip: "Export Open",
                splashRadius: 22.0,
                icon: const Icon(Icons.file_open_outlined),
                onPressed: !isTaskRunnig ? () => downloadAndOpenFile() : null,
              ),
              IconButton(
                tooltip: "Share",
                splashRadius: 22.0,
                icon: const Icon(Icons.share_rounded),
                onPressed: !isTaskRunnig ? () => shareFile() : null,
              ),
              IconButton(
                splashRadius: 22.0,
                tooltip: "App Info",
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AppInfo();
                      });
                },
                icon: const Icon(
                  Icons.info_outline,
                ),
              ),
              const SizedBox(
                width: 10.0,
              )
            ]),
        body: RawScrollbar(
          thumbColor: const Color.fromARGB(255, 113, 47, 255),
          radius: const Radius.circular(15),
          thickness: 4,
          child: Stack(
            children: [
              LogsPage(
                entries: widget.entries,
              ),
              if (isTaskRunnig)
                Container(
                  color: MediaQuery.of(context).platformBrightness ==
                          Brightness.dark
                      ? Colors.black54
                      : Colors.white54,
                  child: const Center(child: CircularProgressIndicator()),
                ),
            ],
          ),
        ));
  }
}
