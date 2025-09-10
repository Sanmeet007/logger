import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:logger/components/common/divider.dart';
import 'package:logger/components/common/log_entry.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/utils/call_display_helper.dart';
import 'package:logger/utils/format_helpers.dart';
import 'package:logger/utils/grouper.dart';

class GroupedLogsBuilder extends StatelessWidget {
  final List<CallLogEntry> entries;
  final String formattedDate;
  final bool groupByContactAndTypes;

  const GroupedLogsBuilder({
    super.key,
    required this.entries,
    required this.formattedDate,
    this.groupByContactAndTypes = false,
  });

  @override
  Widget build(BuildContext context) {
    if (groupByContactAndTypes) {
      final groupedEntries = LogsGrouper.groupByContactAndType(entries);
      return _buildList(context, groupedEntries, formattedDate,
          isGrouped: true);
    } else {
      return _buildList(context, entries, formattedDate, isGrouped: false);
    }
  }

  static Widget _buildList(
    BuildContext context,
    dynamic entries,
    String formattedDate, {
    required bool isGrouped,
  }) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: entries.length,
      itemBuilder: (context, entryIndex) {
        final group =
            isGrouped ? entries[entryIndex] as List<CallLogEntry> : null;
        final entry =
            isGrouped ? group!.first : entries[entryIndex] as CallLogEntry;

        final isUnknown = (entry.name ?? "").isEmpty;
        String name = entry.name?.isNotEmpty == true
            ? entry.name!
            : AppLocalizations.of(context).unknownText;

        if (isGrouped) {
          name = LogsGrouper.addEntryCountToName(name, group!.length);
        }

        final phoneAccountId =
            entry.phoneAccountId ?? AppLocalizations.of(context).unknownText;

        final sim =
            entry.simDisplayName ?? AppLocalizations.of(context).unknownText;

        final duration = entry.duration ?? 0;
        final timestamp = entry.timestamp ?? 1;

        final timeString = FromatHelpers.formatTimeFromTimeStamp(
          context: context,
          timestamp: timestamp,
        );

        final phoneNumber = entry.number ?? AppLocalizations.of(context).naText;

        final details = CallDisplayHelper.getCallDisplayFields(
          entry.callType ?? CallType.unknown,
          context,
        );

        final Color callColor = details[0];
        final IconData callIcon = details[1];
        final String callType = details[2];

        return Column(
          children: [
            if (entryIndex != 0) const LogDivider(),
            LogEntry(
              isUnknown: isUnknown,
              name: name,
              phoneNumber: phoneNumber,
              callIcon: callIcon,
              callColor: callColor,
              timeString: timeString,
              formattedDate: formattedDate,
              duration: duration,
              callType: callType,
              sim: sim,
              phoneAccountId: phoneAccountId,
            ),
          ],
        );
      },
    );
  }
}
