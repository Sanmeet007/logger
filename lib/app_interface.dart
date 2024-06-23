import 'package:call_log/call_log.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
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
                  return Home(
                    setDisplayTimeState: setTimePrefernce,
                    setShareState: setSharePrefernce,
                    initialDisplayLogTimeState: isDisplayLogTimeEnabled,
                    initialShareButtonState: isShareButtonDisabled,
                    entries: entries,
                  );
                } else if (snapshot.hasError) {
                  return const Scaffold(
                    body: Padding(
                      padding: EdgeInsets.all(50.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error,
                              size: 80,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Ah snap! Something went wrong",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? const Color.fromARGB(255, 0, 16, 16)
                        : const Color.fromARGB(255, 255, 239, 239),
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 113, 47, 255),
                      ),
                    ),
                  );
                }
              },
            );
          } else {
            return const Scaffold(
              body: Padding(
                padding: EdgeInsets.all(50.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning,
                        size: 80,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Uh-oh! It seems like access to call logs has been denied. To ensure Logger works smoothly, please grant permission. ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        } else if (snapshot.hasError) {
          return const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(50.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error,
                      size: 80,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Ah snap! Something went wrong",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(
            color: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? const Color.fromARGB(255, 0, 16, 16)
                : const Color.fromARGB(255, 255, 239, 239),
            child: const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 113, 47, 255),
              ),
            ),
          );
        }
      },
    );
  }
}
