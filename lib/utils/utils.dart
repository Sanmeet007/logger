import 'package:call_log/call_log.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

String getVersion() {
  return "1.4.5";
}

String getDeviceType(BuildContext context) {
  var width = MediaQuery.of(context).size.width;
  return (width < 500) ? 'phone' : 'tablet';
}

bool isTabView(BuildContext context) {
  return getDeviceType(context) == "tablet";
}

bool isLargestView(BuildContext context) {
  var width = MediaQuery.of(context).size.width;
  return (width > 1000);
}

String supportURL() {
  return "https://github.com/Sanmeet007/logger";
}

String supportEmail() {
  return "ssanmeet123@gmail.com";
}

String prettifyDate(DateTime inputDate) {
  DateTime now = DateTime.now();
  DateTime today = DateTime.now();
  DateTime yesterday = DateTime(now.year, now.month, now.day - 1);

  if (DateUtils.isSameDay(inputDate, today)) {
    return "Today";
  } else if (DateUtils.isSameDay(inputDate, yesterday)) {
    return "Yesterday";
  } else {
    return DateFormat('dd MMMM yyyy').format(inputDate);
  }
}

Map<String, List<CallLogEntry>> groupCallLogsByDate(
    Iterable<CallLogEntry> callLogs) {
  final Map<String, List<CallLogEntry>> groupedCallLogs = {};

  for (var entry in callLogs) {
    final String dateKey =
        prettifyDate(DateTime.fromMillisecondsSinceEpoch(entry.timestamp ?? 1));
    groupedCallLogs.putIfAbsent(dateKey, () => []).add(entry);
  }

  return groupedCallLogs;
}