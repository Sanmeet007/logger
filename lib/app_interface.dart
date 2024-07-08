import 'package:call_log/call_log.dart';
import 'package:permission_handler/permission_handler.dart';
import 'components/app_error.dart';
import 'components/loader.dart';
import 'package:flutter/material.dart';

import 'screens/app_ui.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: null,
      future: Permission.phone.request(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Loader();
          case ConnectionState.done:
          default:
            if (snapshot.hasData) {
              if (snapshot.data == PermissionStatus.granted) {
                return const RefreshableBuilder();
              } else {
                return const AppError(
                  displayIcon: Icons.warning,
                  errorMessage:
                      "Uh-oh! It seems like access to call logs has been denied. To ensure Logger works smoothly, please grant permission. ",
                );
              }
            } else if (snapshot.hasError) {
              return const AppError(
                displayIcon: Icons.error,
                errorMessage: "Ah snap! Something went wrong",
              );
            } else {
              return const AppError(
                displayIcon: Icons.error,
                errorMessage: "Ah snap! Something unexpected happened!",
              );
            }
        }
      },
    );
  }
}

class RefreshableBuilder extends StatefulWidget {
  const RefreshableBuilder({super.key});

  @override
  State<RefreshableBuilder> createState() => RefreshableBuilderState();
}

class RefreshableBuilderState extends State<RefreshableBuilder> {
  late Future<Iterable<CallLogEntry>> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = CallLog.get();
  }

  Future<void> refresh() async {
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _futureData = CallLog.get();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: null,
      future: _futureData,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Loader();
          default:
            if (snapshot.hasData) {
              final entries = snapshot.data;
              return ApplicationUi(
                entries: entries,
                refresher: refresh,
              );
            } else if (snapshot.hasError) {
              return const AppError(
                displayIcon: Icons.error,
                errorMessage: "Ah snap! Something went wrong",
              );
            } else {
              return const AppError(
                displayIcon: Icons.info,
                errorMessage: "Ah snap! Something unexpected happened!",
              );
            }
        }
      },
    );
  }
}
