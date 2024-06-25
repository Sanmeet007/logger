import 'dart:async';
import 'dart:io';
import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import '../../components/logs.dart';
import 'package:share_plus/share_plus.dart';
import "package:shared_storage/shared_storage.dart";

class HomeScreen extends StatefulWidget {
  final Iterable<CallLogEntry>? entries;
  final bool initialShareButtonState, initialDisplayLogTimeState;
  final Future<void> Function(bool) setDisplayTimeState, setShareState;

  const HomeScreen({
    super.key,
    required this.setDisplayTimeState,
    required this.setShareState,
    required this.entries,
    required this.initialShareButtonState,
    required this.initialDisplayLogTimeState,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Uri? currentFilePath;
  bool isTaskRunnig = false;
  late bool isShareButtonDisabled;
  late bool isDisplayLogTimeEnabled;

  @override
  void initState() {
    super.initState();
    isDisplayLogTimeEnabled = widget.initialDisplayLogTimeState;
    isShareButtonDisabled = widget.initialShareButtonState;
  }

  @override
  Widget build(BuildContext context) {
    const fileNameWithExtension = "output.csv";

    Future<bool> generateLogsFile(Uri parentUri, String filename) async {
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

          DocumentFile? file = await createFileAsString(
            parentUri,
            mimeType: "text/csv",
            displayName: filename,
            content: contents,
          );
          if (file != null) {
            currentFilePath = file.uri;
          }
          return file != null;
        }
        return false;
      } catch (e) {
        return false;
      }
    }

    Future<bool> addLogsToFile(File file) async {
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

    void openFile() async {
      if (currentFilePath != null) {
        await openDocumentFile(currentFilePath as Uri);
      }
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

      final Uri? grantedUri =
          await openDocumentTree(grantWritePermission: true);

      if (grantedUri != null) {
        var milliseconds = DateTime.now().millisecondsSinceEpoch;
        String filename = "logger-$milliseconds-$fileNameWithExtension";

        bool fileStatus = await generateLogsFile(grantedUri, filename);

        if (fileStatus) {
          if (showStatus) downloadStatusSnackbar(status: "success");
          if (showStatus) setState(() => isTaskRunnig = false);
          return true;
        } else {
          if (showStatus) downloadStatusSnackbar(status: "error");
          if (showStatus) setState(() => isTaskRunnig = false);
          return false;
        }
      } else {
        if (showStatus) {
          showSnackBar(
              content: "Unable to get permissions", showCloseIcon: false);
        }
        setState(() => isTaskRunnig = false);
        return false;
      }
    }

    void shareFile() async {
      setState(() {
        isTaskRunnig = true;
      });
      var tempDir = await getTemporaryDirectory();

      DateTime now = DateTime.now();
      String suffix = DateFormat('yyyyMMdd').format(now);
      File file = File("${tempDir.path}/logger_${suffix}_output.csv");
      bool fileGenerationSuccess = await addLogsToFile(file);
      String filePath = file.path;

      if (fileGenerationSuccess) {
        await Share.shareXFiles(
          [XFile(filePath)],
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

    void generateAndOpenFile() async {
      setState(() {
        isTaskRunnig = true;
      });

      var tempDir = await getTemporaryDirectory();
      DateTime now = DateTime.now();
      String suffix = DateFormat('yyyyMMdd').format(now);
      File file = File("${tempDir.path}/logger_${suffix}_output.csv");

      bool fileGenerationSuccess = await addLogsToFile(file);
      String filePath = file.path;

      setState(() {
        isTaskRunnig = false;
      });

      if (fileGenerationSuccess) {
        showSnackBar(content: "Opening file", showCloseIcon: false);
        OpenFile.open(filePath);
      } else {
        showSnackBar(
            content: "Unable to open file please try again later",
            showCloseIcon: false);
      }
    }

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: const Text(
            "Logger",
            style: TextStyle(
              fontSize: 25.0,
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
              onPressed: !isTaskRunnig ? () => generateAndOpenFile() : null,
            ),
            if (!isShareButtonDisabled)
              IconButton(
                tooltip: "Share",
                splashRadius: 22.0,
                icon: const Icon(Icons.share_rounded),
                onPressed: !isTaskRunnig ? () => shareFile() : null,
              ),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
            const SizedBox(
              width: 10.0,
            )
          ]),
      body: RawScrollbar(
        crossAxisMargin: 10.0,
        mainAxisMargin: 10.0,
        thickness: 10.0,
        minThumbLength: 50.0,
        radius: const Radius.circular(10.0),
        interactive: true,
        child: LogsPage(
          showTimeField: isDisplayLogTimeEnabled,
          entries: widget.entries,
        ),
      ),
    );
  }
}
