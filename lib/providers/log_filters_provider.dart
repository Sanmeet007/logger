import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:call_log/call_log.dart';
import 'package:logger/providers/call_logs_provider.dart';
import 'package:logger/providers/current_call_logs_provider.dart';
import 'package:logger/utils/filters.dart';

final defaultFilters = {
  "specific_ph": false,
  "phone_to_match": "",
  "selected_call_types": [...CallType.values], // Creating new mutable List
  "date_range_op": "All Time",
  "start_date": DateTime.now(),
  "end_date": DateTime.now(),
  "min_duration": "0",
  "max_duration": null,
  "duration_filtering": false,
  "phone_acc_id": "Any",
};

class LogsFilterState {
  final Map<String, dynamic> filters;
  final bool areFiltersApplied;

  LogsFilterState({
    required this.filters,
    required this.areFiltersApplied,
  });

  LogsFilterState copyWith(
      {Map<String, dynamic>? filters, bool? areFiltersApplied}) {
    return LogsFilterState(
      filters: filters ?? this.filters,
      areFiltersApplied: areFiltersApplied ?? this.areFiltersApplied,
    );
  }
}

class LogsFilterNotifier extends StateNotifier<LogsFilterState> {
  LogsFilterNotifier(this.ref)
      : super(
          LogsFilterState(
            filters: defaultFilters,
            areFiltersApplied: false,
          ),
        );

  final Ref ref;

  Future<void> applyFilters(Map<String, dynamic> newFilters) async {
    try {
      final allLogs =
          ref.read(callLogsNotifierProvider).value ?? Iterable.empty();

      if (_arePreviousFilters(newFilters)) {
        state = state.copyWith(areFiltersApplied: false);
      } else {
        var filteredLogs = await Filters.filterLogs(allLogs, newFilters);
        state = state.copyWith(areFiltersApplied: true, filters: newFilters);
        ref.read(currentCallLogsNotifierProvider.notifier).update(filteredLogs);
      }
    } catch (_) {
      state = state.copyWith(areFiltersApplied: false);
      ref.read(currentCallLogsNotifierProvider.notifier).reset();
    }
  }

  void resetFilters() {
    state = state.copyWith(
      filters: defaultFilters,
      areFiltersApplied: false,
    );

    ref.read(currentCallLogsNotifierProvider.notifier).reset();
  }

  bool _arePreviousFilters(Map<String, dynamic> newFilters) {
    return Filters.compareFilterMasks(state.filters, newFilters);
  }

  bool containsAnyMatchingCallTypes(List<CallType> types) {
    for (var t in state.filters["selected_call_types"]) {
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
