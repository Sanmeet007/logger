import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:logger/components/logs_builder.dart';
import 'package:logger/utils/utils.dart';

class LogsPage extends StatefulWidget {
  final Iterable<CallLogEntry>? entries;
  const LogsPage({super.key, this.entries});

  @override
  State<LogsPage> createState() => _LogsPageState();
}

class _LogsPageState extends State<LogsPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.entries != null && widget.entries!.isNotEmpty) {
      var logs = groupCallLogsByDate(widget.entries!);
      return ListView.builder(
        itemCount: logs.entries.length,
        itemBuilder: (context, index) {
          final mapEntry = logs.entries.elementAt(index);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Text(mapEntry.key),
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.black45
                      : const Color.fromARGB(255, 249, 245, 255),
                ),
                child: Material(
                  child: GroupedLogsBuilder(
                    entries: mapEntry.value,
                    formattedDate: mapEntry.key,
                  ),
                ),
              )
            ],
          );
        },
      );
    }

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: const Center(child: Text("Nothing to display")),
    );
  }
}
