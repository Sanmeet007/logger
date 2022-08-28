import 'package:call_log/call_log.dart';
import 'home.dart';
import 'package:flutter/material.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

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
      future: CallLog.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var entries = snapshot.data as Iterable<CallLogEntry>?;
          return Home(
            entries: entries,
          );
        } else {
          return Container(
            color: MediaQuery.of(context).platformBrightness == Brightness.dark
                ? const Color.fromARGB(255, 0, 16, 16)
                : const Color.fromARGB(255, 255, 239, 239),
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            ),
          );
        }
      },
    );
  }
}
