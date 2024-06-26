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
    var phoneToMatch = filters["phone_to_match"] as String;
    var shouldUseSpecificPhoneNumber = filters["specific_ph"] as bool;

    var dateRangeOption = filters["date_range_op"] as String;
    var startDate = filters["start_date"] as DateTime;
    var endDate = filters["start_date"] as DateTime;

    setState(() {
      isProcessing = true;

      logFilters["start_date"] = startDate;
      logFilters["end_date"] = endDate;
      logFilters["date_range_op"] = dateRangeOption;
      logFilters["specific_ph"] = shouldUseSpecificPhoneNumber;
      logFilters["phone_to_match"] = phoneToMatch;
    });

    Future.delayed(const Duration(seconds: 2), () {
      // Perform actual filtering here and then update the logs !

      setState(() {
        currentLogs = currentLogs?.where((e) => e.callType == CallType.missed);
        isProcessing = false;
      });
    });
  }

  void removeLogFilters() {
    setState(() {
      logFilters = {
        "specific_ph": false,
        "phone_to_match": "",
        "selected_call_types": [...CallType.values],
        "date_range_op": "All Time",
        "start_date": DateTime.now(),
        "end_date": DateTime.now()
      };
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
