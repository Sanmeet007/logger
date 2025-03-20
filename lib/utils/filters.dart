import 'package:call_log/call_log.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:logger/utils/filter_date_ranges.dart';
import 'package:logger/utils/constants.dart' as constants;

class Filter {
  bool usesSpecificPhoneNumber;
  String phoneToMatch;
  List<CallType> selectedCallTypes;
  DateRange dateRangeOption;
  DateTime startDate;
  DateTime endDate;
  Duration minDuration;
  Duration? maxDuration;
  bool usesDurationFiltering;
  String phoneAccountId;

  Filter({
    this.usesSpecificPhoneNumber = false,
    this.phoneToMatch = "",
    List<CallType>? selectedCallTypes,
    this.dateRangeOption = DateRange.allTime,
    DateTime? startDate,
    DateTime? endDate,
    this.minDuration = Duration.zero,
    this.maxDuration,
    this.usesDurationFiltering = false,
    this.phoneAccountId = constants.defaultPhoneAccountId,
  })  : selectedCallTypes = selectedCallTypes ?? [...CallType.values],
        startDate = startDate ?? DateTime.now(),
        endDate = endDate ?? DateTime.now();

  Filter copyWith({
    bool? usesSpecificPhoneNumber,
    String? phoneToMatch,
    List<CallType>? selectedCallTypes,
    DateRange? dateRangeOption,
    DateTime? startDate,
    DateTime? endDate,
    Duration? minDuration,
    Duration? maxDuration,
    bool? usesDurationFiltering,
    bool? usesPhoneAccountId,
    String? phoneAccountId,
  }) {
    return Filter(
      usesSpecificPhoneNumber:
          usesSpecificPhoneNumber ?? this.usesSpecificPhoneNumber,
      phoneToMatch: phoneToMatch ?? this.phoneToMatch,
      selectedCallTypes: selectedCallTypes ?? [...this.selectedCallTypes],
      dateRangeOption: dateRangeOption ?? this.dateRangeOption,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      minDuration: minDuration ?? this.minDuration,
      maxDuration: maxDuration,
      usesDurationFiltering:
          usesDurationFiltering ?? this.usesDurationFiltering,
      phoneAccountId: phoneAccountId ?? this.phoneAccountId,
    );
  }
}

class FilterUtils {
  static Iterable<CallLogEntry> _getFilteredLogs(Map params) {
    final RootIsolateToken rootIsolateToken = params["root_isolate_token"];
    BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);

    Iterable<CallLogEntry> logs = params["logs"] ?? const Iterable.empty();
    Filter filter = params["filter"] as Filter;

    var callTypes = filter.selectedCallTypes;
    var phoneToMatch = filter.phoneToMatch;
    var shouldUseSpecificPhoneNumber = filter.usesSpecificPhoneNumber;
    var dateRangeOption = filter.dateRangeOption;
    var startDate = filter.startDate;
    var endDate = filter.endDate;
    var minDuration = filter.minDuration.inSeconds;
    var maxDuration = filter.maxDuration?.inSeconds;
    var shouldUseDurationFiltering = filter.usesDurationFiltering;
    var phoneAccountId = filter.phoneAccountId;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final firstDayOfCurrentYear = DateTime(now.year, 1, 1);
    final firstDayOfPreviousYear = DateTime(now.year - 1, 1, 1);
    final firstDayOfNextYear = DateTime(now.year + 1, 1, 1);
    final firstDayOfCurrentMonth = DateTime(now.year, now.month, 1);
    final firstDayOfPreviousMonth = DateTime(now.year, now.month - 1, 1);

    bool matchesPhone(CallLogEntry e) =>
        !shouldUseSpecificPhoneNumber ||
        (e.number?.contains(phoneToMatch) ?? false);

    bool matchesCallType(CallLogEntry e) => callTypes.contains(e.callType);

    bool matchesDate(CallLogEntry e) {
      final entryDate = DateTime.fromMillisecondsSinceEpoch(e.timestamp ?? 1);
      switch (dateRangeOption) {
        case DateRange.today:
          return DateUtils.isSameDay(entryDate, today);
        case DateRange.yesterday:
          return DateUtils.isSameDay(entryDate, yesterday);
        case DateRange.thisMonth:
          return DateUtils.isSameMonth(entryDate, now);
        case DateRange.pastMonth:
          return entryDate.isAfter(firstDayOfPreviousMonth) &&
              entryDate.isBefore(firstDayOfCurrentMonth);
        case DateRange.thisYear:
          return entryDate.isAfter(firstDayOfCurrentYear) &&
              entryDate.isBefore(firstDayOfNextYear);
        case DateRange.pastYear:
          return entryDate.isAfter(firstDayOfPreviousYear) &&
              entryDate.isBefore(firstDayOfCurrentYear);
        case DateRange.custom:
          return entryDate.isAfter(startDate) &&
              entryDate.isBefore(endDate.add(const Duration(days: 1)));
        case DateRange.allTime:
        default:
          return true;
      }
    }

    bool matchesDuration(CallLogEntry e) =>
        !shouldUseDurationFiltering ||
        (e.duration ?? 0) >= minDuration &&
            (maxDuration == null || (e.duration ?? 0) <= maxDuration);

    bool matchesPhoneAccount(CallLogEntry e) =>
        phoneAccountId == constants.defaultPhoneAccountId ||
        (e.phoneAccountId ?? "Unknown") == phoneAccountId;

    return logs.where((e) =>
        matchesPhone(e) &&
        matchesCallType(e) &&
        matchesDate(e) &&
        matchesDuration(e) &&
        matchesPhoneAccount(e));
  }

  static Future<Iterable<CallLogEntry>> filterLogs(
      Iterable<CallLogEntry>? logs, Filter filter) {
    RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;

    return compute(_getFilteredLogs, {
      "logs": logs,
      "filter": filter,
      "root_isolate_token": rootIsolateToken,
    });
  }

  static bool compareFilterMasks(Filter filter1, Filter filter2) {
    if (filter1.usesSpecificPhoneNumber != filter2.usesSpecificPhoneNumber ||
        filter1.phoneToMatch != filter2.phoneToMatch ||
        filter1.dateRangeOption != filter2.dateRangeOption ||
        filter1.phoneAccountId != filter2.phoneAccountId ||
        filter1.usesDurationFiltering != filter2.usesDurationFiltering ||
        filter1.minDuration != filter2.minDuration ||
        (filter1.maxDuration ?? Duration.zero) !=
            (filter2.maxDuration ?? Duration.zero)) {
      return false;
    }

    if (!const SetEquality().equals(
        filter1.selectedCallTypes.toSet(), filter2.selectedCallTypes.toSet())) {
      return false;
    }

    return DateUtils.isSameDay(filter1.startDate, filter2.startDate) &&
        DateUtils.isSameDay(filter1.endDate, filter2.endDate);
  }
}
