import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';

import '../../components/logs.dart';

class HomeScreen extends StatefulWidget {
  final Iterable<CallLogEntry>? entries;

  const HomeScreen({
    super.key,
    required this.entries,
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
    return Scaffold(
      body: LogsPage(
        entries: widget.entries,
      ),
    );
  }
}
