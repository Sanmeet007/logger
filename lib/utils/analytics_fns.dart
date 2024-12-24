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

  static int _getCallTypeCount(Map params) {
    var logs = params["logs"] as Iterable<CallLogEntry>;
    var type = params["type"] as CallType;

    return logs.where((e) => e.callType == type).length;
  }

  static int _getCallTypesCount(Map params) {
    var logs = params["logs"] as Iterable<CallLogEntry>;
    var types = params["types"] as List<CallType>;

    return logs.where((e) => types.contains(e.callType)).length;
  }

  Future<int> getCallTypesCount(List<CallType> types) {
    return compute(_getCallTypesCount, {
      "logs": logs,
      "type": types,
    });
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
    if (logs.isNotEmpty) {
      var seconds = logs.map((e) => e.duration ?? 0).reduce((v, e) => v + e) ~/
          logs.length;
      return Duration(seconds: seconds);
    } else {
      return const Duration(seconds: 0);
    }
  }

  Future<Duration> getTotalCallDuration() {
    return compute(_getTotalCallDuration, logs);
  }

  static Duration _getTotalCallDuration(Iterable<CallLogEntry> logs) {
    if (logs.isEmpty) return const Duration(seconds: 0);
    var seconds = logs.map((e) => e.duration ?? 0).reduce((acc, curr) {
      acc += curr;
      return acc;
    });
    return Duration(seconds: seconds);
  }

  Future<Duration> getAvgCallDuration() {
    return compute(_getAvgCallDuration, logs);
  }

  static Duration _getLongestCallDuration(Iterable<CallLogEntry> logs) {
    if (logs.isEmpty) return const Duration(seconds: 0);
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
    if (logs.isEmpty) return List.empty();

    List<CallLogEntry> sortedLogs = logs.toList();
    sortedLogs.sort((a, b) => Duration(seconds: b.duration ?? 0)
        .compareTo(Duration(seconds: a.duration ?? 0)));

    List<String> result = LinkedHashSet<String>.from(sortedLogs.map((item) {
      if (item.number != null) {
        return parsePhoneNumber(item.number!);
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

  static CallLogEntryWithFreq? _getMaxFrequentlyCalledEntry(
      Iterable<CallLogEntry> logs) {
    if (logs.isEmpty) return null;

    var filterdedLogs = logs.where((e) =>
        (e.callType == CallType.outgoing) ||
        (e.callType == CallType.wifiOutgoing));

    // Create a frequency map to count occurrences of each phone number
    Map<String, int> frequencyMap = {};
    for (var entry in filterdedLogs) {
      if (entry.number != null) {
        var x = parsePhoneNumber(entry.number!);
        frequencyMap[x] = (frequencyMap[x] ?? 0) + 1;
      }
    }

    // Convert the map to a list of entries sorted by frequency in descending order
    List<MapEntry<String, int>> sortedFrequencyList = frequencyMap.entries
        .toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    // Get the most frequently called phone number
    if (sortedFrequencyList.isEmpty) return null;

    var mostFrequentPhoneNumber = sortedFrequencyList.first;

    // Create a list of CallLogEntry for the most and least frequently called phone numbers
    List<CallLogEntry> resultEntries = [];
    // Add the most frequently called entry
    resultEntries.add(filterdedLogs.firstWhere((entry) =>
        parsePhoneNumber(entry.number ?? "") == mostFrequentPhoneNumber.key));

    if (resultEntries.isEmpty) return null;

    // Add the least frequently called entry
    return CallLogEntryWithFreq(
        entry: resultEntries[0], count: mostFrequentPhoneNumber.value);
  }

  static CallLogEntryWithFreq? _getMaxFrequentlyReceivedEntry(
      Iterable<CallLogEntry> logs) {
    if (logs.isEmpty) return null;

    var filterdedLogs = logs.where((e) =>
        (e.callType == CallType.incoming) || (e.callType == CallType.incoming));

    // Create a frequency map to count occurrences of each phone number
    Map<String, int> frequencyMap = {};
    for (var entry in filterdedLogs) {
      if (entry.number != null) {
        var x = parsePhoneNumber(entry.number!);
        frequencyMap[x] = (frequencyMap[x] ?? 0) + 1;
      }
    }

    // Convert the map to a list of entries sorted by frequency in descending order
    List<MapEntry<String, int>> sortedFrequencyList = frequencyMap.entries
        .toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    // Get the most frequently called phone number
    if (sortedFrequencyList.isEmpty) return null;

    var mostFrequentPhoneNumber = sortedFrequencyList.first;

    // Create a list of CallLogEntry for the most and least frequently called phone numbers
    List<CallLogEntry> resultEntries = [];
    // Add the most frequently called entry
    resultEntries.add(filterdedLogs.firstWhere((entry) =>
        parsePhoneNumber(entry.number ?? "") == mostFrequentPhoneNumber.key));

    if (resultEntries.isEmpty) return null;

    // Add the least frequently called entry
    return CallLogEntryWithFreq(
        entry: resultEntries[0], count: mostFrequentPhoneNumber.value);
  }

  Future<CallLogEntryWithFreq?> getMaxFrequentlyCalledEntry() {
    return compute(_getMaxFrequentlyCalledEntry, logs);
  }

  Future<CallLogEntryWithFreq?> getMaxFrequentlyReceivedEntry() {
    return compute(_getMaxFrequentlyReceivedEntry, logs);
  }
}
