import 'package:call_log/call_log.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:logger/screens/Onboarding/onboarding.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/app_error.dart';
import 'components/loader.dart';
import 'package:flutter/material.dart';

import 'screens/app_ui.dart';

class Application extends StatelessWidget {
  final WidgetsBinding widgetsBinding;
  const Application({super.key, required this.widgetsBinding});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: null,
      future: SharedPreferences.getInstance(),
      builder: (context, prefsSnapShot) {
        switch (prefsSnapShot.connectionState) {
          case ConnectionState.waiting:
            return const SizedBox();
          case ConnectionState.done:
          default:
            FlutterNativeSplash.remove();
            if (prefsSnapShot.hasData) {
              bool showOnboarding =
                  prefsSnapShot.data?.getBool("show-onboarding") ?? true;
              if (showOnboarding) {
                return OnboardingUI(prefs: prefsSnapShot.data);
              } else {
                return BaseApplication(prefs: prefsSnapShot.data);
              }
            } else {
              return const AppError(
                displayIcon: Icons.error,
                errorMessage: "Ah! Snap error loading preferences",
              );
            }
        }
      },
    );
  }
}

class BaseApplication extends StatelessWidget {
  final SharedPreferences? prefs;

  const BaseApplication({
    super.key,
    required this.prefs,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: null,
      future: [
        Permission.phone,
        Permission.contacts,
      ].request(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Loader();
          case ConnectionState.done:
          default:
            if (snapshot.hasData) {
              if (snapshot.data == PermissionStatus.granted) {
                return RefreshableBuilder(
                  preferences: prefs,
                );
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
  final SharedPreferences? preferences;
  const RefreshableBuilder({super.key, required this.preferences});

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
                preferences: widget.preferences,
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
