import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:call_log/call_log.dart';
import 'package:logger/providers/call_logs_provider.dart';
import 'package:logger/providers/current_call_logs_provider.dart';
import 'package:logger/utils/filters.dart';

final defaultFilter = Filter();

class LogsFilterState {
  final Filter filter;
  final bool areFiltersApplied;

  LogsFilterState({
    required this.filter,
    required this.areFiltersApplied,
  });

  LogsFilterState copyWith({Filter? filter, bool? areFiltersApplied}) {
    return LogsFilterState(
      filter: filter ?? this.filter,
      areFiltersApplied: areFiltersApplied ?? this.areFiltersApplied,
    );
  }
}

class LogsFilterNotifier extends StateNotifier<LogsFilterState> {
  LogsFilterNotifier(this.ref)
      : super(
          LogsFilterState(
            filter: defaultFilter,
            areFiltersApplied: false,
          ),
        );

  final Ref ref;

  Future<void> applyFilters(Filter newFilter) async {
    try {
      final allLogs =
          ref.read(callLogsNotifierProvider).value ?? Iterable.empty();

      if (_arePreviousFilters(newFilter)) {
        state = state.copyWith(areFiltersApplied: false);
      } else {
        var filteredLogs = await FilterUtils.filterLogs(allLogs, newFilter);

        if (FilterUtils.compareFilterMasks(newFilter, defaultFilter)) {
          state =
              state.copyWith(areFiltersApplied: false, filter: defaultFilter);
        } else {
          state = state.copyWith(areFiltersApplied: true, filter: newFilter);
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
      filter: defaultFilter,
      areFiltersApplied: false,
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
