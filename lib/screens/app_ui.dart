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
    var endDate = filters["end_date"] as DateTime;

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
        final DateTime now = DateTime.now();
        final DateTime today = DateTime.now();
        final DateTime yesterday = DateTime(now.year, now.month, now.day - 1);
        final DateTime firstDayOfCurrentYear = DateTime(now.year, 1, 1);
        final DateTime firstDayOfPreviousYear = DateTime(now.year - 1, 1, 1);
        final DateTime firstDayOfNextYear = DateTime(now.year + 1, 1, 1);
        final DateTime firstDayOfCurrentMonth =
            DateTime(now.year, now.month, 1);
        final DateTime firstDayOfPreviousMonth = DateTime(
            firstDayOfCurrentMonth.year, firstDayOfCurrentMonth.month - 1, 1);

        switch (dateRangeOption) {
          case "Today":
            currentLogs = widget.entries?.where((e) {
              return (shouldUseSpecificPhoneNumber
                      ? e.number?.contains(phoneToMatch) ?? false
                      : true) &&
                  callTypes.contains(e.callType) &&
                  DateUtils.isSameDay(today,
                      DateTime.fromMillisecondsSinceEpoch(e.timestamp ?? 1));
            });
            break;
          case "Yesterday":
            currentLogs = widget.entries?.where((e) {
              return (shouldUseSpecificPhoneNumber
                      ? e.number?.contains(phoneToMatch) ?? false
                      : true) &&
                  callTypes.contains(e.callType) &&
                  DateUtils.isSameDay(yesterday,
                      DateTime.fromMillisecondsSinceEpoch(e.timestamp ?? 1));
            });
            break;
          case "This Month":
            currentLogs = widget.entries?.where((e) {
              return (shouldUseSpecificPhoneNumber
                      ? e.number?.contains(phoneToMatch) ?? false
                      : true) &&
                  callTypes.contains(e.callType) &&
                  DateUtils.isSameMonth(now,
                      DateTime.fromMillisecondsSinceEpoch(e.timestamp ?? 1));
            });
            break;
          case "Past Month":
            currentLogs = widget.entries?.where((e) {
              DateTime entryDate =
                  DateTime.fromMillisecondsSinceEpoch(e.timestamp ?? 1);
              return (shouldUseSpecificPhoneNumber
                      ? e.number?.contains(phoneToMatch) ?? false
                      : true) &&
                  callTypes.contains(e.callType) &&
                  entryDate.isAfter(firstDayOfPreviousMonth
                      .subtract(const Duration(seconds: 1))) &&
                  entryDate.isBefore(firstDayOfCurrentMonth);
            });
            break;
          case "This Year":
            currentLogs = widget.entries?.where((e) {
              DateTime entryDate =
                  DateTime.fromMillisecondsSinceEpoch(e.timestamp ?? 1);
              return (shouldUseSpecificPhoneNumber
                      ? e.number?.contains(phoneToMatch) ?? false
                      : true) &&
                  callTypes.contains(e.callType) &&
                  entryDate.isAfter(firstDayOfCurrentYear) &&
                  entryDate.isBefore(firstDayOfNextYear);
            });
            break;
          case "Past Year":
            currentLogs = widget.entries?.where((e) {
              DateTime entryDate =
                  DateTime.fromMillisecondsSinceEpoch(e.timestamp ?? 1);
              return (shouldUseSpecificPhoneNumber
                      ? e.number?.contains(phoneToMatch) ?? false
                      : true) &&
                  callTypes.contains(e.callType) &&
                  entryDate.isAfter(firstDayOfPreviousYear) &&
                  entryDate.isBefore(firstDayOfCurrentYear);
            });
            break;
          case "Custom":
            currentLogs = widget.entries?.where((e) {
              DateTime entryDate =
                  DateTime.fromMillisecondsSinceEpoch(e.timestamp ?? 1);
              return (shouldUseSpecificPhoneNumber
                      ? e.number?.contains(phoneToMatch) ?? false
                      : true) &&
                  callTypes.contains(e.callType) &&
                  (entryDate.isAfter(
                          startDate.subtract(const Duration(seconds: 1))) &&
                      entryDate.isBefore(
                        endDate.add(const Duration(seconds: 1, days: 1)),
                      ));
            });
            break;

          case "All Time":
            currentLogs = widget.entries?.where((e) =>
                (shouldUseSpecificPhoneNumber
                    ? e.number?.contains(phoneToMatch) ?? false
                    : true) &&
                callTypes.contains(e.callType));
            break;

          default:
            currentLogs =
                widget.entries?.where((e) => callTypes.contains(e.callType));
        }

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
              child: const Center(child: CircularProgressIndicator())),
      ],
    );
  }
}
