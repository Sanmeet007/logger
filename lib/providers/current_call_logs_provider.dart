import 'package:call_log/call_log.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/call_logs_provider.dart';

class CurrentCallLogsNotifier extends StateNotifier<Iterable<CallLogEntry>> {
  final Ref ref;

  CurrentCallLogsNotifier(this.ref) : super(Iterable.empty()) {
    _initialize();
  }

  void _initialize() {
    final asyncCallLogs = ref.watch(callLogsNotifierProvider);
    if (asyncCallLogs.hasValue) {
      state = asyncCallLogs.value ?? Iterable.empty();
    }
  }

  void update(Iterable<CallLogEntry> entries) {
    state = entries;
  }

  void reset() {
    final asyncCallLogs = ref.read(callLogsNotifierProvider);
    if (asyncCallLogs.hasValue) {
      state = asyncCallLogs.value ?? Iterable.empty();
    }
  }
}

final currentCallLogsNotifierProvider =
    StateNotifierProvider<CurrentCallLogsNotifier, Iterable<CallLogEntry>>(
  CurrentCallLogsNotifier.new,
);
