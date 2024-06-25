import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';

class LogEntry extends StatelessWidget {
  const LogEntry({
    super.key,
    required this.name,
    required this.callIcon,
    required this.callColor,
    required this.timeString,
    required this.formattedDate,
    required this.duration,
    required this.callType,
    required this.sim,
    required this.phoneAccountId,
    required this.phoneNumber,
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
    return Slidable(
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const StretchMotion(),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            flex: 1,
            onPressed: (context) async {
              var uri = Uri.parse("tel:$phoneNumber");
              await launchUrl(uri);
            },
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.call,
            label: 'Call',
          ),
          SlidableAction(
            // An action can be bigger than the others.
            flex: 1,
            onPressed: (context) async {
              var uri = Uri.parse("sms:$phoneNumber");
              await launchUrl(uri);
            },
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.message,
            label: 'SMS',
          ),
        ],
      ),
      child: ListTile(
          tileColor: const Color.fromARGB(8, 144, 92, 255),
          onTap: () {
            showModalBottomSheet(
                showDragHandle: true,
                context: context,
                isScrollControlled: true,
                builder: (context) {
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
                                  Text(name),
                                  Text(
                                    phoneNumber,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 13),
                                  )
                                ],
                              ),
                              trailing: Icon(
                                callIcon,
                                color: callColor,
                              ),
                              leading: CircleAvatar(
                                  child: Text(
                                name[0],
                              )),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.black45
                                    : const Color.fromARGB(255, 249, 245, 255),
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: const Text("Time"),
                                    trailing: Text(timeString),
                                  ),
                                  ListTile(
                                    title: const Text("Date"),
                                    trailing: Text(formattedDate),
                                  ),
                                  ListTile(
                                    title: const Text("Duration"),
                                    trailing: Text("$duration" "s"),
                                  ),
                                  ListTile(
                                    title: const Text("Call Type"),
                                    trailing: Text(callType),
                                  ),
                                  ListTile(
                                    title: const Text("SIM Display Name"),
                                    trailing: Text(sim),
                                  ),
                                  ListTile(
                                    title: const Text("Phone Account ID "),
                                    trailing: Text(phoneAccountId),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("CLOSE"),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                  );
                });
          },
          minVerticalPadding: 14.0,
          leading: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Container(
              color: callColor,
              padding: const EdgeInsets.all(8),
              child: Icon(callIcon),
            ),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                timeString,
                style: TextStyle(
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.dark
                        ? const Color.fromARGB(255, 206, 206, 206)
                        : const Color.fromARGB(255, 80, 76, 81),
                    fontSize: 14),
              ),
            ],
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              Text(
                callType,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          )),
    );
  }
}
