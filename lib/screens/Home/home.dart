import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';

import '../../components/logs.dart';

class HomeScreen extends StatefulWidget {
  final Iterable<CallLogEntry>? entries;
  final Future<void> Function()? refreshEntries;
  final bool callLogCountVisibility;

  const HomeScreen({
    super.key,
    required this.entries,
    required this.refreshEntries,
    required this.callLogCountVisibility,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        if (widget.refreshEntries != null) {
          await widget.refreshEntries!();
        }
      },
      child: LogsPage(
        entries: widget.entries,
        callLogCountVisibility: widget.callLogCountVisibility,
      ),
    );
  }
}
