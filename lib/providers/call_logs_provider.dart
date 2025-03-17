import 'package:call_log/call_log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class CallLogsNotifier extends AsyncNotifier<Iterable<CallLogEntry>> {
  @override
  FutureOr<Iterable<CallLogEntry>> build() async {
    return await CallLog.get();
  }

  Future<void> hardRefresh() async {
    state = await AsyncValue.guard(() async {
      return await CallLog.get();
    });
  }
}

final callLogsNotifierProvider =
    AsyncNotifierProvider<CallLogsNotifier, Iterable<CallLogEntry>>(
        CallLogsNotifier.new);
