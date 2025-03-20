import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:call_log/call_log.dart';
import 'package:logger/providers/call_logs_provider.dart';
import 'package:logger/providers/current_call_logs_provider.dart';
import 'package:logger/providers/filter_presets_provider.dart';
import 'package:logger/utils/filters.dart';

class LogsFilterState {
  final Filter filter;
  final bool areFiltersApplied;
  final int activeFilterId;

  LogsFilterState({
    required this.filter,
    required this.areFiltersApplied,
    required this.activeFilterId,
  });

  LogsFilterState copyWith(
      {Filter? filter, bool? areFiltersApplied, int? activeFilterId}) {
    return LogsFilterState(
      filter: filter ?? this.filter,
      areFiltersApplied: areFiltersApplied ?? this.areFiltersApplied,
      activeFilterId: activeFilterId ?? this.activeFilterId,
    );
  }
}

class LogsFilterNotifier extends StateNotifier<LogsFilterState> {
  LogsFilterNotifier(this.ref)
      : super(
          LogsFilterState(
            filter: Filter.defaultFilterConfig,
            areFiltersApplied: false,
            activeFilterId: -1,
          ),
        );

  final Ref ref;

  Future<void> changeActiveFilterById(int id) async {
    try {
      final filterPreset =
          await ref.read(filterPresetsProvider.notifier).getPresetById(id);

      final allLogs =
          ref.read(callLogsNotifierProvider).value ?? Iterable.empty();

      state = state.copyWith(
        areFiltersApplied: true,
        filter: filterPreset.filterDetails,
        activeFilterId: filterPreset.id,
      );

      var filteredLogs =
          await FilterUtils.filterLogs(allLogs, filterPreset.filterDetails);
      ref.read(currentCallLogsNotifierProvider.notifier).update(filteredLogs);
    } catch (_) {
      state = state.copyWith(areFiltersApplied: false);
      ref.read(currentCallLogsNotifierProvider.notifier).reset();
    }
  }

  Future<void> applyFilters(Filter newFilter, [int? id]) async {
    try {
      final allLogs =
          ref.read(callLogsNotifierProvider).value ?? Iterable.empty();

      if (_arePreviousFilters(newFilter)) {
        state = state.copyWith(areFiltersApplied: false);
      } else {
        var filteredLogs = await FilterUtils.filterLogs(allLogs, newFilter);

        if (FilterUtils.compareFilterMasks(
            newFilter, Filter.defaultFilterConfig)) {
          state = state.copyWith(
            areFiltersApplied: false,
            filter: Filter.defaultFilterConfig,
            activeFilterId: id,
          );
        } else {
          state = state.copyWith(
            areFiltersApplied: true,
            filter: newFilter,
            activeFilterId: id,
          );
        }

        ref.read(currentCallLogsNotifierProvider.notifier).update(filteredLogs);
      }
    } catch (_) {
      state = state.copyWith(areFiltersApplied: false);
      ref.read(currentCallLogsNotifierProvider.notifier).reset();
    }
  }

  void resetFilters() {
    state = state.copyWith(
      filter: Filter.defaultFilterConfig,
      areFiltersApplied: false,
      activeFilterId: -1,
    );

    ref.read(currentCallLogsNotifierProvider.notifier).reset();
  }

  bool _arePreviousFilters(Filter newFilters) {
    return FilterUtils.compareFilterMasks(state.filter, newFilters);
  }

  bool containsAnyMatchingCallTypes(List<CallType> types) {
    for (var t in state.filter.selectedCallTypes) {
      if (types.contains(t)) {
        return true;
      }
    }
    return false;
  }
}

final logsFilterProvider =
    StateNotifierProvider<LogsFilterNotifier, LogsFilterState>((ref) {
  return LogsFilterNotifier(ref);
});
