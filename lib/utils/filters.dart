import 'package:call_log/call_log.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Filters {
  static Iterable<CallLogEntry> _getFilteredLogs(Map params) {
    var logs =
        params["logs"] ?? const Iterable.empty() as Iterable<CallLogEntry>;
    var filters = params["filters"] as Map;

    var callTypes = filters["selected_call_types"] as List<CallType>;
    var phoneToMatch = filters["phone_to_match"] as String;
    var shouldUseSpecificPhoneNumber = filters["specific_ph"] as bool;
    var dateRangeOption = filters["date_range_op"] as String;
    var startDate = filters["start_date"] as DateTime;
    var endDate = filters["end_date"] as DateTime;

    final DateTime now = DateTime.now();
    final DateTime today = DateTime.now();
    final DateTime yesterday = DateTime(now.year, now.month, now.day - 1);
    final DateTime firstDayOfCurrentYear = DateTime(now.year, 1, 1);
    final DateTime firstDayOfPreviousYear = DateTime(now.year - 1, 1, 1);
    final DateTime firstDayOfNextYear = DateTime(now.year + 1, 1, 1);
    final DateTime firstDayOfCurrentMonth = DateTime(now.year, now.month, 1);
    final DateTime firstDayOfPreviousMonth = DateTime(
        firstDayOfCurrentMonth.year, firstDayOfCurrentMonth.month - 1, 1);

    switch (dateRangeOption) {
      case "Today":
        logs = logs?.where((e) {
          return (shouldUseSpecificPhoneNumber
                  ? e.number?.contains(phoneToMatch) ?? false
                  : true) &&
              callTypes.contains(e.callType) &&
              DateUtils.isSameDay(
                  today, DateTime.fromMillisecondsSinceEpoch(e.timestamp ?? 1));
        });
        break;
      case "Yesterday":
        logs = logs?.where((e) {
          return (shouldUseSpecificPhoneNumber
                  ? e.number?.contains(phoneToMatch) ?? false
                  : true) &&
              callTypes.contains(e.callType) &&
              DateUtils.isSameDay(yesterday,
                  DateTime.fromMillisecondsSinceEpoch(e.timestamp ?? 1));
        });
        break;
      case "This Month":
        logs = logs?.where((e) {
          return (shouldUseSpecificPhoneNumber
                  ? e.number?.contains(phoneToMatch) ?? false
                  : true) &&
              callTypes.contains(e.callType) &&
              DateUtils.isSameMonth(
                  now, DateTime.fromMillisecondsSinceEpoch(e.timestamp ?? 1));
        });
        break;
      case "Past Month":
        logs = logs?.where((e) {
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
        logs = logs?.where((e) {
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
        logs = logs?.where((e) {
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
        logs = logs?.where((e) {
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
        logs = logs?.where((e) =>
            (shouldUseSpecificPhoneNumber
                ? e.number?.contains(phoneToMatch) ?? false
                : true) &&
            callTypes.contains(e.callType));
        break;

      default:
        logs = logs?.where((e) => callTypes.contains(e.callType));
    }

    return logs;
  }

  static Future<Iterable<CallLogEntry>> filterLogs(
      Iterable<CallLogEntry>? logs, Map filters) {
    return compute(_getFilteredLogs, {
      "logs": logs,
      "filters": filters,
    });
  }
}
