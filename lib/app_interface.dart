import 'package:call_log/call_log.dart';
import 'package:logger/screens/About/about.dart';
import 'package:logger/screens/Analytics/analytics.dart';
import 'package:logger/screens/manager.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/app_error.dart';
import 'components/loader.dart';
import 'screens/Home/home.dart';
import 'package:flutter/material.dart';

class Application extends StatefulWidget {
  final SharedPreferences preferences;
  const Application({super.key, required this.preferences});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late bool isShareButtonDisabled;
  late bool isDisplayLogTimeEnabled;

  @override
  void initState() {
    super.initState();

    isShareButtonDisabled =
        widget.preferences.getBool("disable_share_pref") ?? false;
    isDisplayLogTimeEnabled =
        widget.preferences.getBool("display_mtime_pref") ?? true;
  }

  Future<void> setSharePrefernce(bool v) {
    return widget.preferences.setBool("disable_share_pref", v);
  }

  Future<void> setTimePrefernce(bool v) {
    return widget.preferences.setBool("display_mtime_pref", v);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: null,
      future: Permission.phone.request(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == PermissionStatus.granted) {
            return FutureBuilder(
              initialData: null,
              future: CallLog.get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var entries = snapshot.data as Iterable<CallLogEntry>?;
                  return ScreenManager(items: <Screen>[
                    Screen(
                      label: "Logs",
                      icon: Icons.call_outlined,
                      selectedIcon: Icons.call,
                      screen: HomeScreen(
                        setDisplayTimeState: setTimePrefernce,
                        setShareState: setSharePrefernce,
                        initialDisplayLogTimeState: isDisplayLogTimeEnabled,
                        initialShareButtonState: isShareButtonDisabled,
                        entries: entries,
                      ),
                    ),
                    const Screen(
                      label: "Analytics",
                      icon: Icons.pie_chart_outline,
                      selectedIcon: Icons.pie_chart,
                      screen: AnalyticsScreen(),
                    ),
                    const Screen(
                      label: "About",
                      icon: Icons.info,
                      selectedIcon: Icons.info,
                      screen: AboutScreen(),
                    ),
                  ]);
                } else if (snapshot.hasError) {
                  return const AppError(
                    displayIcon: Icons.error,
                    errorMessage: "Ah snap! Something went wrong",
                  );
                } else {
                  return const Loader();
                }
              },
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
          return const Loader();
        }
      },
    );
  }
}
