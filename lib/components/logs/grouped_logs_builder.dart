import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:logger/components/common/divider.dart';
import 'package:logger/components/common/log_entry.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/components/logs/grouped_slidable.dart';
import 'package:logger/utils/call_display_helper.dart';
import 'package:logger/utils/format_helpers.dart';
import 'package:logger/utils/grouper.dart';

class GroupedLogsBuilder extends StatelessWidget {
  final List<CallLogEntry> entries;
  final String formattedDate;
  final GroupBy groupBy;

  const GroupedLogsBuilder({
    super.key,
    required this.entries,
    required this.formattedDate,
    this.groupBy = GroupBy.none,
  });

  @override
  Widget build(BuildContext context) {
    if (groupBy == GroupBy.contactAndType) {
      final groupedEntries = LogsGrouper.groupByContactAndType(entries);
      return _buildList(context, groupedEntries, formattedDate,
          isGrouped: true);
    } else if (groupBy == GroupBy.contactOnlyConsecutive) {
      final groupedEntries = LogsGrouper.groupByContactOnlyConsecutive(entries);
      return _buildList(context, groupedEntries, formattedDate,
          isGrouped: true);
    } else if (groupBy == GroupBy.contactOnly) {
      final groupedEntries = LogsGrouper.groupByContactOnly(entries);
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
            if (group != null && group.length > 1)
              GroupedLogsExplorer(
                headerValues: HeaderValues(
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
                entries: group,
              ),
            if ((group != null && group.length == 1) || (group == null))
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

class GroupedLogsExplorer extends StatefulWidget {
  final List<CallLogEntry> entries;
  final HeaderValues headerValues;

  const GroupedLogsExplorer({
    super.key,
    required this.entries,
    required this.headerValues,
  });

  @override
  State<GroupedLogsExplorer> createState() => _GroupedLogsExplorerState();
}

class _GroupedLogsExplorerState extends State<GroupedLogsExplorer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GroupedSlidable(
      logDetails: widget.entries.first,
      child: ExpansionPanelList(
        elevation: 0,
        expansionCallback: (int index, bool expanded) {
          setState(() {
            isExpanded = expanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool expanded) {
              return ListTile(
                leading: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Container(
                    color: widget.headerValues.callColor,
                    padding: const EdgeInsets.all(8),
                    child: Icon(widget.headerValues.callIcon),
                  ),
                ),
                title: Text(
                  widget.headerValues.name,
                ),
                subtitle: Text(
                    "${AppLocalizations.of(context).lastCallText} • ${widget.headerValues.timeString}"),
              );
            },
            canTapOnHeader: true,
            body: Column(
              children: widget.entries.map((entry) {
                final isUnknown = (entry.name ?? "").isEmpty;
                final name = entry.name?.isNotEmpty == true
                    ? entry.name!
                    : AppLocalizations.of(context).unknownText;

                final phoneNumber =
                    entry.number ?? AppLocalizations.of(context).naText;

                final details = CallDisplayHelper.getCallDisplayFields(
                  entry.callType ?? CallType.unknown,
                  context,
                );

                return LogEntry(
                  isUnknown: isUnknown,
                  name: name,
                  phoneNumber: phoneNumber,
                  callIcon: details[1],
                  callColor: details[0],
                  timeString: FromatHelpers.formatTimeFromTimeStamp(
                    context: context,
                    timestamp: entry.timestamp ?? 1,
                  ),
                  formattedDate: widget.headerValues.formattedDate,
                  duration: entry.duration ?? 0,
                  callType: details[2],
                  sim: entry.simDisplayName ??
                      AppLocalizations.of(context).unknownText,
                  phoneAccountId: entry.phoneAccountId ??
                      AppLocalizations.of(context).unknownText,
                );
              }).toList(),
            ),
            isExpanded: isExpanded,
          ),
        ],
      ),
    );
  }
}
