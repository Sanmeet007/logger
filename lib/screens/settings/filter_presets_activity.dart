import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/components/common/divider.dart';
import 'package:logger/components/common/sized_text.dart';
import 'package:logger/data/models/filter_preset.dart';
import 'package:logger/providers/call_logs_provider.dart';
import 'package:logger/providers/filter_presets_provider.dart';
import 'package:logger/providers/log_filters_provider.dart';
import 'package:logger/providers/shared_preferences_providers/duration_filtering_provider.dart';
import 'package:logger/providers/shared_preferences_providers/phone_account_filtering_provider.dart';
import 'package:logger/providers/shared_preferences_providers/uses_filter_presets_provider.dart';
import 'package:logger/screens/settings/preset_editor.dart';
import 'package:logger/utils/filters.dart';
import 'package:logger/utils/constants.dart' as constants;

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterPresetsActivity extends ConsumerStatefulWidget {
  const FilterPresetsActivity({super.key});

  @override
  ConsumerState<FilterPresetsActivity> createState() =>
      _FilterPresetsActivityState();
}

class _FilterPresetsActivityState extends ConsumerState<FilterPresetsActivity> {
  void addNewPresetDialog() {
    showModalBottomSheet(
        context: context,
        showDragHandle: true,
        isScrollControlled: true,
        builder: (context) {
          return PresetEditor(
            canFilterUsingDuration: ref.read(durationFilteringProvider),
            canFilterUsingPhoneAccountId:
                ref.read(phoneAccountFilteringProvider),
            availablePhoneAccountIds: ref
                .read(callLogsNotifierProvider.notifier)
                .getAvailablePhoneAccountIds(),
            preset: FilterPreset(
              name: "SuperCoolPreset",
              filterDetails: Filter.defaultFilterConfig,
            ),
          );
        });
  }

  Future<void> deletePresetById(int id) async {
    ref.read(logsFilterProvider.notifier).resetFilters();
    await ref.read(filterPresetsProvider.notifier).deleteFilterPresetById(id);
  }

  void deleteAllPresets() async {
    ref.read(logsFilterProvider.notifier).resetFilters();
    await ref.read(filterPresetsProvider.notifier).purge();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Filter presets"),
        actions: [
          IconButton(
            onPressed: () async {
              await ref.read(filterPresetsProvider.notifier).refreshPresets();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Material(
            child: SwitchListTile(
              title: Text(
                ref.watch(filterPresetsUsageProvider) ? "On" : "Off",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              value: ref.watch(filterPresetsUsageProvider),
              onChanged: (v) {
                ref.read(filterPresetsUsageProvider.notifier).toggle();
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding:
                EdgeInsets.only(top: 0, bottom: 20.0, left: 15.0, right: 15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  FilterPresetsList(
                    deletePreset: deletePresetById,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed:
                        (ref.watch(filterPresetsProvider).value?.length ?? 0) <=
                                constants.maxAllowedPresets
                            ? addNewPresetDialog
                            : null,
                    child: Wrap(spacing: 10.0, children: [
                      Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      Text("ADD MORE"),
                    ]),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  OutlinedButton(
                    onPressed: deleteAllPresets,
                    child: Wrap(spacing: 10.0, children: [
                      Icon(Icons.delete),
                      Text("DELETE ALL"),
                    ]),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class FilterPresetsList extends ConsumerWidget {
  final Future<void> Function(int) deletePreset;
  const FilterPresetsList({super.key, required this.deletePreset});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterPresetsState = ref.watch(filterPresetsProvider);

    return filterPresetsState.when(
      loading: () => Text("Loading"),
      data: (presets) {
        if (presets.isEmpty) {
          return Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Text(
                "Start creating your own custom presets for quick filtering",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Theme.of(context).hintColor,
                ),
              ),
            ),
          );
        } else {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Material(
                  child: ListTile(
                    leading: SizedText(
                      "${i + 1}.",
                      size: 18.0,
                    ),
                    trailing: IconButton(
                      onPressed: () => deletePreset(presets[i].id),
                      icon: Icon(Icons.delete),
                    ),
                    onTap: () {},
                    title: Text(presets[i].name),
                  ),
                );
              },
              separatorBuilder: (context, i) {
                return const LogDivider();
              },
              itemCount: presets.length,
            ),
          );
        }
      },
      error: (err, _) => Container(
        child: Text("error $err"),
      ),
    );
  }
}
