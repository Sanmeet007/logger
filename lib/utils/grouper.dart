import 'package:call_log/call_log.dart';

class LogsGrouper {
  static List<List<CallLogEntry>> groupByContactAndType(
      List<CallLogEntry> entries) {
    if (entries.isEmpty) return [];

    List<List<CallLogEntry>> grouped = [];
    List<CallLogEntry> currentGroup = [entries.first];

    for (int i = 1; i < entries.length; i++) {
      var prev = entries[i - 1];
      var curr = entries[i];

      String prevKey = (prev.name ?? '') +
          (prev.number ?? '') +
          (prev.callType?.toString() ?? '');
      String currKey = (curr.name ?? '') +
          (curr.number ?? '') +
          (curr.callType?.toString() ?? '');

      if (prevKey == currKey) {
        currentGroup.add(curr);
      } else {
        grouped.add(currentGroup);
        currentGroup = [curr];
      }
    }

    grouped.add(currentGroup);
    return grouped;
  }

  static String addEntryCountToName(String name, int count) {
    if (count > 1) {
      return "$name ($count)";
    } else {
      return name;
    }
  }
}
