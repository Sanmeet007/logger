import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:logger/utils/phone_formatter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum GroupBy { none, contactAndType, contactOnly, contactOnlyConsecutive }

class LogsGrouper {
  static ({String title, String description}) getGroupByTypeDetails(
      BuildContext context, GroupBy t) {
    switch (t) {
      case GroupBy.contactAndType:
        return (
          title: AppLocalizations.of(context).groupByContactAndTypeTitle,
          description:
              AppLocalizations.of(context).groupByContactAndTypeDescription,
        );

      case GroupBy.contactOnlyConsecutive:
        return (
          title:
              AppLocalizations.of(context).groupByContactOnlyConsecutiveTitle,
          description: AppLocalizations.of(context)
              .groupByContactOnlyConsecutiveDescription,
        );

      case GroupBy.contactOnly:
        return (
          title: AppLocalizations.of(context).groupByContactOnlyTitle,
          description:
              AppLocalizations.of(context).groupByContactOnlyDescription,
        );

      case GroupBy.none:
        return (
          title: AppLocalizations.of(context).defaultLabelText,
          description: AppLocalizations.of(context).groupByNoneDescription,
        );
    }
  }

  static List<List<CallLogEntry>> groupByContactAndType(
      List<CallLogEntry> entries) {
    if (entries.isEmpty) return [];

    List<List<CallLogEntry>> grouped = [];
    List<CallLogEntry> currentGroup = [entries.first];

    for (int i = 1; i < entries.length; i++) {
      var prev = entries[i - 1];
      var curr = entries[i];

      final prevNumber = PhoneFormatter.parsePhoneNumber(prev.number ?? "");
      final currNumber = PhoneFormatter.parsePhoneNumber(prev.number ?? "");

      String prevKey =
          (prev.name ?? '') + (prevNumber) + (prev.callType?.toString() ?? '');
      String currKey =
          (curr.name ?? '') + (currNumber) + (curr.callType?.toString() ?? '');

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

  static List<List<CallLogEntry>> groupByContactOnlyConsecutive(
      List<CallLogEntry> entries) {
    if (entries.isEmpty) return [];

    List<List<CallLogEntry>> grouped = [];
    List<CallLogEntry> currentGroup = [entries.first];

    for (int i = 1; i < entries.length; i++) {
      var prev = entries[i - 1];
      var curr = entries[i];

      final prevNumber = PhoneFormatter.parsePhoneNumber(prev.number ?? "");
      final currNumber = PhoneFormatter.parsePhoneNumber(prev.number ?? "");

      String prevKey = (prev.name ?? '') + (prevNumber);
      String currKey = (curr.name ?? '') + (currNumber);

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

  static List<List<CallLogEntry>> groupByContactOnly(
      List<CallLogEntry> entries) {
    if (entries.isEmpty) return [];

    final Map<String, List<CallLogEntry>> groupedMap = {};

    for (final entry in entries) {
      final key = PhoneFormatter.parsePhoneNumber(entry.number ?? "");
      groupedMap.putIfAbsent(key, () => []);
      groupedMap[key]!.add(entry);
    }

    return groupedMap.values.toList();
  }

  static String addEntryCountToName(String name, int count) {
    if (count > 1) {
      return "$name ($count)";
    } else {
      return name;
    }
  }
}

class HeaderValues {
  final bool isUnknown;
  final String name;
  final String phoneNumber;
  final IconData callIcon;
  final Color callColor;
  final String timeString;
  final String formattedDate;
  final int duration;
  final String callType;
  final String sim;
  final String phoneAccountId;

  const HeaderValues({
    required this.name,
    required this.callIcon,
    required this.callColor,
    required this.timeString,
    required this.formattedDate,
    required this.duration,
    required this.callType,
    required this.sim,
    required this.phoneAccountId,
    required this.phoneNumber,
    required this.isUnknown,
  });
}
