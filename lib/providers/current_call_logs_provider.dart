import 'package:call_log/call_log.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/call_logs_provider.dart';
import 'package:logger/providers/shared_preferences_providers/call_rounding_provider.dart';

class CurrentCallLogsNotifier extends Notifier<Iterable<CallLogEntry>> {
  @override
  Iterable<CallLogEntry> build() {
    final asyncCallLogs = ref.watch(callLogsNotifierProvider);
    final shouldRoundDuration = ref.watch(callRoundingProvider);

    if (asyncCallLogs.hasValue) {
      final logs = asyncCallLogs.value ?? Iterable.empty();
      return shouldRoundDuration ? _roundLogs(logs) : logs;
    }

    return Iterable.empty();
  }

  void update(Iterable<CallLogEntry> entries) {
    state = entries;
  }

  void reset() {
    ref.invalidateSelf();
  }

  Iterable<CallLogEntry> _roundLogs(Iterable<CallLogEntry> logs) {
    return logs.map((log) {
      final durationSec = log.duration ?? 0;
      final roundedDurationSec = ((durationSec / 60).ceil()) * 60;
      log.duration = roundedDurationSec;
      return log;
    });
  }
}

final currentCallLogsNotifierProvider =
    NotifierProvider<CurrentCallLogsNotifier, Iterable<CallLogEntry>>(
  CurrentCallLogsNotifier.new,
);
