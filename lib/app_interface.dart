import 'package:call_log/call_log.dart';
import 'package:permission_handler/permission_handler.dart';
import 'home.dart';
import 'package:flutter/material.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    super.initState();
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
