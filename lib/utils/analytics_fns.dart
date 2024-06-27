import 'package:logger/utils/utils.dart';
import 'dart:collection';
import 'dart:math';
import 'package:call_log/call_log.dart';
import 'package:flutter/foundation.dart';

class CallLogEntryWithFreq {
  final CallLogEntry entry;
  final int count;
  const CallLogEntryWithFreq({required this.entry, required this.count});
}

class CallLogAnalyzer {
  final Iterable<CallLogEntry> logs;
  const CallLogAnalyzer({required this.logs});

  int _getCallTypeCount(Map params) {
    var logs = params["logs"] as Iterable<CallLogEntry>;
    var type = params["type"] as CallType;

    return logs.where((e) => e.callType == type).length;
  }

  Future<int> getCallTypeCount(CallType type) {
    return compute(_getCallTypeCount, {
      "logs": logs,
      "type": type,
    });
  }

  static int _getIncomingCallTypeCount(Iterable<CallLogEntry> logs) {
    return logs
        .where((e) =>
            (e.callType == CallType.incoming) ||
            (e.callType == CallType.wifiIncoming))
        .length;
  }

  Future<int> getIncomingCallTypeCount() {
    return compute(_getIncomingCallTypeCount, logs);
  }

  static int _getOutgoingCallTypeCount(Iterable<CallLogEntry> logs) {
    return logs
        .where((e) =>
            (e.callType == CallType.outgoing) ||
            (e.callType == CallType.wifiOutgoing))
        .length;
  }

  Future<int> getOutgoingCallTypeCount() {
    return compute(_getOutgoingCallTypeCount, logs);
  }

  static Duration _getAvgCallDuration(Iterable<CallLogEntry> logs) {
    var seconds =
        logs.map((e) => e.duration ?? 0).reduce((v, e) => v + e) ~/ logs.length;
    return Duration(seconds: seconds);
  }

  Future<Duration> getAvgCallDuration() {
    return compute(_getAvgCallDuration, logs);
  }

  static Duration _getLongestCallDuration(Iterable<CallLogEntry> logs) {
    var seconds = logs.map((e) => e.duration ?? 0).reduce((v, e) {
      v = max(v, e);
      return v;
    });
    return Duration(seconds: seconds);
  }

  Future<Duration> getLongestCallDuration() {
    return compute(_getLongestCallDuration, logs);
  }

  static List<CallLogEntry> _getTop5CallDurationEntries(
      Iterable<CallLogEntry> logs) {
    List<CallLogEntry> sortedLogs = logs.toList();
    sortedLogs.sort((a, b) => Duration(seconds: b.duration ?? 0)
        .compareTo(Duration(seconds: a.duration ?? 0)));

    List<String> result = LinkedHashSet<String>.from(sortedLogs.map((item) {
      if (item.number != null) {
        if (item.number!.startsWith("+")) {
          return parsePhoneNumber(item.number!);
        } else {
          return item.number;
        }
      } else {
        return null;
      }
    })).toList();

    List<CallLogEntry> finalList = [];

    result.take(5).forEach((String num) {
      finalList.add(sortedLogs
          .firstWhere((x) => parsePhoneNumber(x.number ?? "") == num));
    });

    return finalList;
  }

  Future<List<CallLogEntry>> getTop5CallDurationEntries() {
    return compute(_getTop5CallDurationEntries, logs);
  }

  static List<CallLogEntryWithFreq> _getMaxLeastFrequentlyCalledEntries(
      Iterable<CallLogEntry> logs) {
    var filterdedLogs = logs.where((e) =>
        (e.callType == CallType.outgoing) ||
        (e.callType == CallType.wifiOutgoing));

    // Create a frequency map to count occurrences of each phone number
    Map<String, int> frequencyMap = {};
    for (var entry in filterdedLogs) {
      frequencyMap[entry.number ?? 'na'] =
          (frequencyMap[entry.number ?? 'na'] ?? 0) + 1;
    }

    // Convert the map to a list of entries sorted by frequency in descending order
    List<MapEntry<String, int>> sortedFrequencyList = frequencyMap.entries
        .toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    // Get the most frequently called phone number
    var mostFrequentPhoneNumber = sortedFrequencyList.first;
    // Get the least frequently called phone number
    var leastFrequentPhoneNumber = sortedFrequencyList.last;

    // Create a list of CallLogEntry for the most and least frequently called phone numbers
    List<CallLogEntry> resultEntries = [];
    // Add the most frequently called entry
    resultEntries.add(filterdedLogs
        .firstWhere((entry) => entry.number == mostFrequentPhoneNumber.key));
    // Add the least frequently called entry
    resultEntries.add(filterdedLogs
        .firstWhere((entry) => entry.number == leastFrequentPhoneNumber.key));

    return [
      CallLogEntryWithFreq(
          entry: resultEntries[0], count: mostFrequentPhoneNumber.value),
      CallLogEntryWithFreq(
          entry: resultEntries[0], count: leastFrequentPhoneNumber.value)
    ];
  }

  Future<List<CallLogEntryWithFreq>> getMaxLeastFrequentlyCalledEntries() {
    return compute(_getMaxLeastFrequentlyCalledEntries, logs);
  }
}
