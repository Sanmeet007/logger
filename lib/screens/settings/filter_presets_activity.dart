import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/components/common/divider.dart';
import 'package:logger/components/common/loader.dart';
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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterPresetsActivity extends ConsumerStatefulWidget {
  const FilterPresetsActivity({super.key});

  @override
  ConsumerState<FilterPresetsActivity> createState() =>
      _FilterPresetsActivityState();
}

class _FilterPresetsActivityState extends ConsumerState<FilterPresetsActivity> {
  bool isProcessing = false;

  void showLoading() {
    setState(() {
      isProcessing = true;
    });
  }

  void hideLoading() {
    setState(() {
      isProcessing = false;
    });
  }

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
              name: AppLocalizations.of(context).defaultPresetName,
              filterDetails: Filter.defaultFilterConfig,
            ),
          );
        });
  }

  Future<void> editPresetDialog(int id) async {
    final preset =
        await ref.read(filterPresetsProvider.notifier).getPresetById(id);

    if (mounted) {
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
              preset: preset,
            );
          });
    }
  }

  Future<void> deletePresetById(int id) async {
    ref.read(logsFilterProvider.notifier).resetFilters();
    await ref.read(filterPresetsProvider.notifier).deleteFilterPresetById(id);
  }

  void deleteAllPresets() async {
    ref.read(logsFilterProvider.notifier).resetFilters();
    await ref.read(filterPresetsProvider.notifier).purge();
  }

  void Function()? getDeleteAllPresetsAction(bool canUsePresets,
      AsyncValue<List<FilterPreset>> filterPresetsProviderInstance) {
    return filterPresetsProviderInstance.isLoading ||
            filterPresetsProviderInstance.isRefreshing ||
            filterPresetsProviderInstance.isReloading
        ? null
        : canUsePresets
            ? (ref.watch(filterPresetsProvider).value?.length ?? 0) != 0
                ? deleteAllPresets
                : null
            : null;
  }

  void Function()? getAddPresetAction(bool canUsePresets,
      AsyncValue<List<FilterPreset>> filterPresetsProviderInstance) {
    return filterPresetsProviderInstance.isLoading ||
            filterPresetsProviderInstance.isRefreshing ||
            filterPresetsProviderInstance.isReloading
        ? null
        : canUsePresets
            ? (ref.watch(filterPresetsProvider).value?.length ?? 0) <
                    constants.maxAllowedPresets
                ? addNewPresetDialog
                : null
            : null;
  }

  @override
  Widget build(BuildContext context) {
    final canUsePresets = ref.watch(filterPresetsUsageProvider);
    final filterPresetsProviderInstance = ref.watch(filterPresetsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          AppLocalizations.of(context).filterPresetTitle,
        ),
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
                ref.watch(filterPresetsUsageProvider)
                    ? AppLocalizations.of(context).onLabel
                    : AppLocalizations.of(context).offLabel,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              value: canUsePresets,
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
                    editPreset: editPresetDialog,
                    deletePreset: deletePresetById,
                    enabled: canUsePresets,
                  ),
                  if (!filterPresetsProviderInstance.hasError)
                    SizedBox(
                      height: 20.0,
                    ),
                  if (!filterPresetsProviderInstance.hasError)
                    ElevatedButton(
                      onPressed: getAddPresetAction(
                        canUsePresets,
                        filterPresetsProviderInstance,
                      ),
                      child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runAlignment: WrapAlignment.center,
                          spacing: 10.0,
                          children: [
                            Icon(
                              Icons.add,
                            ),
                            Text(
                              AppLocalizations.of(context)
                                  .addMorePresetsLabel
                                  .toUpperCase(),
                            ),
                          ]),
                    ),
                  if (!filterPresetsProviderInstance.hasError)
                    SizedBox(
                      height: 10.0,
                    ),
                  if (!filterPresetsProviderInstance.hasError)
                    OutlinedButton(
                      onPressed: getDeleteAllPresetsAction(
                        canUsePresets,
                        filterPresetsProviderInstance,
                      ),
                      child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runAlignment: WrapAlignment.center,
                          spacing: 10.0,
                          children: [
                            Icon(Icons.delete),
                            Text(
                              AppLocalizations.of(context)
                                  .deleteAllPresetsLabel
                                  .toUpperCase(),
                            ),
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
  final Future<void> Function(int) editPreset;

  final bool enabled;
  const FilterPresetsList({
    super.key,
    required this.deletePreset,
    required this.editPreset,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!enabled) {
      return FilterPresetsPlaceholder(
        message: AppLocalizations.of(context).enablePresetsPlaceholderText,
      );
    }

    final filterPresetsState = ref.watch(filterPresetsProvider);

    return filterPresetsState.when(
      loading: () => FilterPresetsPlaceholderWidget(
        child: Loader(),
      ),
      data: (presets) {
        if (presets.isEmpty) {
          return FilterPresetsPlaceholder(
            message: AppLocalizations.of(context).noPresetsPlaceholderText,
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
                    onTap: () {
                      editPreset(presets[i].id);
                    },
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
      error: (err, _) => FilterPresetsPlaceholder(
        message: AppLocalizations.of(context).appFatalError,
      ),
    );
  }
}

class FilterPresetsPlaceholder extends StatelessWidget {
  final String message;

  const FilterPresetsPlaceholder({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            color: Theme.of(context).hintColor,
          ),
        ),
      ),
    );
  }
}

class FilterPresetsPlaceholderWidget extends StatelessWidget {
  final Widget child;
  final double height;

  const FilterPresetsPlaceholderWidget({
    super.key,
    required this.child,
    this.height = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
