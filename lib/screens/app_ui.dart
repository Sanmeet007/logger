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
  @override
  Widget build(BuildContext context) {
    Iterable<CallLogEntry>? currentLogs = widget.entries;

    void filterLogs() {
      setState(() {
        // currentLogs
      });
    }

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
