import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:logger/utils/format_helpers.dart';

class CallLogGrouper {
  static Map<String, List<CallLogEntry>> groupCallLogsByDate(
      Iterable<CallLogEntry> callLogs, BuildContext context) {
    final Map<String, List<CallLogEntry>> groupedCallLogs = {};

    for (var entry in callLogs) {
      final String dateKey = FromatHelpers.prettifyDate(
          DateTime.fromMillisecondsSinceEpoch(entry.timestamp ?? 1), context);
      groupedCallLogs.putIfAbsent(dateKey, () => []).add(entry);
    }

    return groupedCallLogs;
  }
}
