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
  bool isProcessing = false;

  // Logs filters
  Map logFilters = {
    "specific_ph": false,
    "phone_to_match": "",
    "selected_call_types": [...CallType.values],
    "date_range_op": "All Time",
    "start_date": DateTime.now(),
    "end_date": DateTime.now()
  };

  void filterLogs(Map filters) {
    var callTypes = filters["selected_call_types"] as List<CallType>;
    print(callTypes);
    setState(() {
      isProcessing = true;
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isProcessing = false;
      });
    });
  }

  void removeLogFilters() {
    setState(() {
      currentLogs = widget.entries;
    });
  }

  @override
  void initState() {
    super.initState();
    currentLogs = widget.entries;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScreenManager(
          currentFilters: logFilters,
          logs: currentLogs,
          filterLogs: filterLogs,
          removeLogFilters: removeLogFilters,
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
        ),
        if (isProcessing)
          Container(
              color: Colors.black38,
              child: Center(child: CircularProgressIndicator())),
      ],
    );
  }
}
