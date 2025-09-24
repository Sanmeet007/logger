import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/components/common/divider.dart';
import 'package:logger/providers/shared_preferences_providers/grouped_calls_type_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/utils/format_helpers.dart';
import 'package:logger/utils/grouper.dart';

class GroupCallsDialog extends ConsumerStatefulWidget {
  final GroupBy groupBy;
  const GroupCallsDialog({super.key, required this.groupBy});

  @override
  ConsumerState<GroupCallsDialog> createState() => _GroupCallsDialogState();
}

class _GroupCallsDialogState extends ConsumerState<GroupCallsDialog> {
  late GroupBy initialGroupType;
  late GroupBy currentGroupType;

  @override
  void initState() {
    initialGroupType = widget.groupBy;
    currentGroupType = widget.groupBy;

    super.initState();
  }

  void updateGroupTypeAndExit() {
    ref.read(groupedCallsTypeProvider.notifier).setMode(currentGroupType);
    setState(() {
      initialGroupType = currentGroupType;
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
                    onPressed: currentGroupType == initialGroupType
                        ? null
                        : updateGroupTypeAndExit,
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
