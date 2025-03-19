import 'package:call_log/call_log.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:logger/utils/filter_date_ranges.dart';

class Filters {
  static Iterable<CallLogEntry> _getFilteredLogs(Map params) {
    final RootIsolateToken rootIsolateToken = params["root_isolate_token"];

    var logs =
        params["logs"] ?? const Iterable.empty() as Iterable<CallLogEntry>;
    var filters = params["filters"] as Map;

    BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);

    var callTypes = filters["selected_call_types"] as List<CallType>;
    var phoneToMatch = filters["phone_to_match"] as String;
    var shouldUseSpecificPhoneNumber = filters["specific_ph"] as bool;
    var dateRangeOption = filters["date_range_op"] as DateRange;
    var startDate = filters["start_date"] as DateTime;
    var endDate = filters["end_date"] as DateTime;
    var minDuration = filters["min_duration"] as String?;
    var maxDuration = filters["max_duration"] as String?;
    var shouldUseDurationFiltering = filters["duration_filtering"] as bool;
    var phoneAccountId = filters["phone_acc_id"] as String;

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
      case DateRange.today:
        logs = logs?.where((e) {
          return (shouldUseSpecificPhoneNumber
                  ? e.number?.contains(phoneToMatch) ?? false
                  : true) &&
              callTypes.contains(e.callType) &&
              DateUtils.isSameDay(
                  today, DateTime.fromMillisecondsSinceEpoch(e.timestamp ?? 1));
        });
        break;
      case DateRange.yesterday:
        logs = logs?.where((e) {
          return (shouldUseSpecificPhoneNumber
                  ? e.number?.contains(phoneToMatch) ?? false
                  : true) &&
              callTypes.contains(e.callType) &&
              DateUtils.isSameDay(yesterday,
                  DateTime.fromMillisecondsSinceEpoch(e.timestamp ?? 1));
        });
        break;
      case DateRange.thisMonth:
        logs = logs?.where((e) {
          return (shouldUseSpecificPhoneNumber
                  ? e.number?.contains(phoneToMatch) ?? false
                  : true) &&
              callTypes.contains(e.callType) &&
              DateUtils.isSameMonth(
                  now, DateTime.fromMillisecondsSinceEpoch(e.timestamp ?? 1));
        });
        break;
      case DateRange.pastMonth:
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
      case DateRange.thisYear:
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
      case DateRange.pastYear:
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
      case DateRange.custom:
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

      case DateRange.allTime:
        logs = logs?.where((e) =>
            (shouldUseSpecificPhoneNumber
                ? e.number?.contains(phoneToMatch) ?? false
                : true) &&
            callTypes.contains(e.callType));
        break;

      default:
        logs = logs?.where((e) => callTypes.contains(e.callType));
    }

    if (shouldUseDurationFiltering) {
      if (minDuration != null) {
        var k = int.tryParse(minDuration);

        if (k != null && k > 0) {
          logs = (logs as Iterable<CallLogEntry>?)
              ?.where((e) => ((e.duration ?? 0) >= k));
        }
      }

      if (maxDuration != null) {
        var k = int.tryParse(maxDuration);
        if (k != null && k > 0) {
          logs = (logs as Iterable<CallLogEntry>?)
              ?.where((e) => ((e.duration ?? 0) <= k));
        }
      }
    }

    if (phoneAccountId != "Any") {
      logs = (logs as Iterable<CallLogEntry>?)
          ?.where((e) => ((e.phoneAccountId ?? "Unknown") == phoneAccountId));
    }

    return logs;
  }

  static Future<Iterable<CallLogEntry>> filterLogs(
      Iterable<CallLogEntry>? logs, Map filters) {
    RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;

    return compute(_getFilteredLogs, {
      "logs": logs,
      "filters": filters,
      "root_isolate_token": rootIsolateToken,
    });
  }

  static bool compareFilterMasks(Map mask1, Map mask2) {
    if (mask1["specific_ph"] != mask2["specific_ph"]) {
      return false;
    }
    if (mask1["phone_to_match"] != mask2["phone_to_match"]) {
      return false;
    }
    if (mask1["date_range_op"] != mask2["date_range_op"]) {
      return false;
    }
    // Compare call type array

    var cts1 = mask1["selected_call_types"] as List<CallType>;
    var cts2 = mask2["selected_call_types"] as List<CallType>;

    if (!const SetEquality().equals(cts1.toSet(), cts2.toSet())) {
      return false;
    }

    if (mask1["phone_acc_id"] != mask2["phone_acc_id"]) {
      return false;
    }

    if (mask1["duration_filtering"] != mask2["duration_filtering"]) {
      return false;
    }

    String mask1MaxDuration = mask1["max_duration"] as String? ?? "";
    String mask2MaxDuration = mask2["max_duration"] as String? ?? "";

    String mask1MinDuration = mask1["min_duration"] as String? ?? "";
    String mask2MinDuration = mask2["min_duration"] as String? ?? "";

    if (int.tryParse(mask1MaxDuration) != int.tryParse(mask2MaxDuration)) {
      return false;
    }
    if (int.tryParse(mask1MinDuration) != int.tryParse(mask2MinDuration)) {
      return false;
    }

    // Compare dates
    DateTime mask1StartDate = mask1["start_date"] as DateTime;
    DateTime mask2StartDate = mask2["start_date"] as DateTime;

    DateTime mask1EndDate = mask1["end_date"] as DateTime;
    DateTime mask2EndDate = mask2["end_date"] as DateTime;

    if (!DateUtils.isSameDay(mask1StartDate, mask2StartDate)) {
      return false;
    }
    if (!DateUtils.isSameDay(mask1EndDate, mask2EndDate)) {
      return false;
    }

    return true;
  }
}
