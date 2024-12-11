import 'package:flutter/material.dart';
import 'package:logger/components/divider.dart';
import 'package:logger/utils/utils.dart';

class LogDetails extends StatelessWidget {
  const LogDetails({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.callIcon,
    required this.callColor,
    required this.timeString,
    required this.formattedDate,
    required this.duration,
    required this.callType,
    required this.sim,
    required this.phoneAccountId,
  });

  final String name;
  final String phoneNumber;
  final IconData callIcon;
  final Color callColor;
  final String timeString;
  final String formattedDate;
  final int duration;
  final String callType;
  final String sim;
  final String phoneAccountId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(12),
          color: Theme.of(context).canvasColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      phoneNumber,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
                trailing: Icon(
                  callIcon,
                  color: callColor,
                ),
                leading: CircleAvatar(
                  child: Text(
                    name.isNotEmpty ? name[0] : '?',
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black45
                      : const Color.fromARGB(255, 249, 245, 255),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: const Text(
                        "Time",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      trailing: Text(
                        timeString,
                        style: const TextStyle(fontSize: 15.0),
                      ),
                    ),
                    const LogDivider(),
                    ListTile(
                      title: const Text(
                        "Date",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      trailing: Text(
                        formattedDate,
                        style: const TextStyle(fontSize: 15.0),
                      ),
                    ),
                    const LogDivider(),
                    ListTile(
                      title: const Text(
                        "Duration",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      trailing: Text(
                        prettifyDuration(Duration(seconds: duration)),
                        style: const TextStyle(fontSize: 15.0),
                      ),
                    ),
                    const LogDivider(),
                    ListTile(
                      title: const Text(
                        "Call Type",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      trailing: Text(
                        callType,
                        style: const TextStyle(fontSize: 15.0),
                      ),
                    ),
                    const LogDivider(),
                    ListTile(
                      title: const Text(
                        "SIM Display Name",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      trailing: Text(
                        sim,
                        style: const TextStyle(fontSize: 15.0),
                      ),
                    ),
                    const LogDivider(),
                    ListTile(
                      title: const Text(
                        "Phone Account ID ",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      trailing: FittedBox(
                        child: Text(
                          shrinkPhoneAccountID(phoneAccountId),
                          style: const TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
