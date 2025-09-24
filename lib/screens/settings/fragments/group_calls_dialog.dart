import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/components/common/divider.dart';
import 'package:logger/components/common/sized_text.dart';
import 'package:logger/providers/shared_preferences_providers/grouped_calls_type_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/providers/shared_preferences_providers/use_grouping_with_filters.dart';
import 'package:logger/utils/format_helpers.dart';
import 'package:logger/utils/grouper.dart';

class GroupCallsDialog extends ConsumerStatefulWidget {
  final GroupBy groupBy;
  final bool isFilterGroupingEnabled;
  const GroupCallsDialog({
    super.key,
    required this.groupBy,
    required this.isFilterGroupingEnabled,
  });

  @override
  ConsumerState<GroupCallsDialog> createState() => _GroupCallsDialogState();
}

class _GroupCallsDialogState extends ConsumerState<GroupCallsDialog> {
  late GroupBy initialGroupType;
  late GroupBy currentGroupType;
  late bool initialGroupingState;
  late bool currentGroupingState;

  @override
  void initState() {
    initialGroupType = widget.groupBy;
    currentGroupType = widget.groupBy;
    initialGroupingState = widget.isFilterGroupingEnabled;
    currentGroupingState = widget.isFilterGroupingEnabled;

    super.initState();
  }

  void updateAndExit() {
    ref.read(filterGroupingProvider.notifier).setMode(currentGroupingState);
    ref.read(groupedCallsTypeProvider.notifier).setMode(currentGroupType);

    setState(() {
      initialGroupType = currentGroupType;
      initialGroupingState = currentGroupingState;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Material(
                child: SwitchListTile(
                  enableFeedback: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                  title: SizedText(
                    AppLocalizations.of(context).useGroupingSwitchText,
                    size: 18.0,
                  ),
                  value: currentGroupingState,
                  onChanged: currentGroupType == GroupBy.none
                      ? null
                      : (v) => setState(() {
                            currentGroupingState = v;
                          }),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Material(
                color: Colors.transparent,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const LogDivider();
                  },
                  itemCount: GroupBy.values.length,
                  itemBuilder: (context, index) {
                    final t = GroupBy.values[index];
                    final v = LogsGrouper.getGroupByTypeDetails(context, t);
                    return RadioListTile(
                      title: Text(
                        FromatHelpers.capitalizeString(v.title),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        v.description,
                      ),
                      value: t,
                      groupValue: currentGroupType,
                      onChanged: (GroupBy? value) {
                        if (value == null) return;

                        setState(() {
                          currentGroupType = value;
                        });
                      },
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppLocalizations.of(context).cancelText,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: currentGroupType == initialGroupType &&
                            currentGroupingState == initialGroupingState
                        ? null
                        : updateAndExit,
                    child: Text(
                      AppLocalizations.of(context).saveText,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
