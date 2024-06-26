import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:logger/screens/About/about.dart';
import 'package:logger/screens/Analytics/analytics.dart';
import 'package:logger/screens/Home/home.dart';
import 'package:logger/screens/manager.dart';

class ApplicationUi extends StatefulWidget {
  const ApplicationUi({
    super.key,
    required this.entries,
  });

  final Iterable<CallLogEntry>? entries;

  @override
  State<ApplicationUi> createState() => _ApplicationUiState();
}

class _ApplicationUiState extends State<ApplicationUi> {
  late Iterable<CallLogEntry>? currentLogs;
  void filterLogs() {
    setState(() {
      // currentLogs
    });
  }

  @override
  void initState() {
    super.initState();
    currentLogs = widget.entries;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenManager(
      logs: currentLogs,
      filterLogs: filterLogs,
      items: <Screen>[
        Screen(
          label: "Logs",
          icon: Icons.call_outlined,
          selectedIcon: Icons.call,
          screen: HomeScreen(
            entries: currentLogs,
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
      ],
    );
  }
}
