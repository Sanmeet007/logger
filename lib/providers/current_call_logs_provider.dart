import 'package:call_log/call_log.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/call_logs_provider.dart';
import 'package:logger/providers/shared_preferences_providers/call_rounding_provider.dart';

class CurrentCallLogsNotifier extends StateNotifier<Iterable<CallLogEntry>> {
  final Ref ref;

  CurrentCallLogsNotifier(this.ref) : super(Iterable.empty()) {
    _initialize();
  }

  void _initialize() {
    final asyncCallLogs = ref.watch(callLogsNotifierProvider);
    if (asyncCallLogs.hasValue) {
      bool shouldRoundDuration = ref.watch(callRoundingProvider);
      var logs = asyncCallLogs.value ?? Iterable.empty();

      state = shouldRoundDuration
          ? logs.map((log) {
              final durationSec = log.duration ?? 0;
              final roundedDurationSec = ((durationSec / 60).ceil()) * 60;
              log.duration = roundedDurationSec;
              return log;
            })
          : logs;
    }
  }

  void update(Iterable<CallLogEntry> entries) {
    state = entries;
  }

  void reset() {
    final asyncCallLogs = ref.read(callLogsNotifierProvider);
    if (asyncCallLogs.hasValue) {
      bool shouldRoundDuration = ref.watch(callRoundingProvider);
      var logs = asyncCallLogs.value ?? Iterable.empty();
      state = shouldRoundDuration
          ? logs.map((log) {
              final durationSec = log.duration ?? 0;
              final roundedDurationSec = ((durationSec / 60).ceil()) * 60;
              log.duration = roundedDurationSec;
              return log;
            })
          : logs;
    }
  }
}

final currentCallLogsNotifierProvider =
    StateNotifierProvider<CurrentCallLogsNotifier, Iterable<CallLogEntry>>(
  CurrentCallLogsNotifier.new,
);
