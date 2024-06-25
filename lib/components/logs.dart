import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LogsPage extends StatefulWidget {
  final Iterable<CallLogEntry>? entries;
  final bool showTimeField;
  const LogsPage({super.key, this.entries, required this.showTimeField});

  @override
  State<LogsPage> createState() => _LogsPageState();
}

class _LogsPageState extends State<LogsPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.entries != null && widget.entries!.isNotEmpty) {
      return ListView.separated(
          separatorBuilder: (context, index) {
            return Divider(
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.dark
                      ? const Color.fromARGB(255, 18, 0, 40)
                      : const Color.fromRGBO(246, 239, 255, 1),
              height: 0,
            );
          },
          itemCount: widget.entries!.length,
          itemBuilder: (BuildContext context, int index) {
            String name = widget.entries!.elementAt(index).name ?? "Unknown";
            if (name == "") name = "Unknown";

            String callType =
                widget.entries!.elementAt(index).callType.toString();

            String phoneAccountId =
                widget.entries!.elementAt(index).phoneAccountId ?? "Unknown";

            String sim =
                widget.entries!.elementAt(index).simDisplayName ?? "Unknown";

            int duration = widget.entries!.elementAt(index).duration ?? 0;
            int timestamp = widget.entries!.elementAt(index).timestamp ?? 1;
            var date = DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
            String formattedDate = DateFormat.yMMMEd().format(date);
            String timeString = DateFormat('hh:mm a').format(date);

            late Color callColor;
            late IconData callIcon;

            if (callType == "CallType.missed") {
              callType = "Missed";
              callColor = Colors.deepOrange;
              callIcon = Icons.call_missed;
            } else if (callType == "CallType.incoming") {
              callType = "Incoming";
              callColor = Colors.blue;
              callIcon = Icons.call_received;
            } else if (callType == "CallType.outgoing") {
              callType = "Outgoing";
              callColor = Colors.green;
              callIcon = Icons.call;
            } else {
              callType = "Unknown";
              callColor = Colors.grey;
              callIcon = Icons.call;
            }

            return ListTile(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(name),
                                        Text(
                                          "${widget.entries!.elementAt(index).number}",
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
                                          : const Color.fromARGB(
                                              255, 249, 245, 255),
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
                                          title:
                                              const Text("Phone Account ID "),
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
                      formattedDate,
                      style: TextStyle(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.dark
                              ? const Color.fromARGB(255, 206, 206, 206)
                              : const Color.fromARGB(255, 80, 76, 81),
                          fontSize: 12),
                    ),
                    if (widget.showTimeField)
                      Text(
                        timeString,
                        style: TextStyle(
                            color: MediaQuery.of(context).platformBrightness ==
                                    Brightness.dark
                                ? const Color.fromARGB(255, 206, 206, 206)
                                : const Color.fromARGB(255, 80, 76, 81),
                            fontSize: 12),
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
                ));
          });
    }

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: const Center(child: Text("Nothing to display")),
    );
  }
}
