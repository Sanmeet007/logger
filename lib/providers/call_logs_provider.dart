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

  List<String> getAvailablePhoneAccountIds() {
    if (state.value != null) {
      final uniquePhoneAccountIds = <String>{"Any"};
      for (var entry in state.value!) {
        uniquePhoneAccountIds.add(entry.phoneAccountId ?? "Unknown");
      }
      return uniquePhoneAccountIds.toList();
    } else {
      return List.empty();
    }
  }
}

final callLogsNotifierProvider =
    AsyncNotifierProvider<CallLogsNotifier, Iterable<CallLogEntry>>(
        CallLogsNotifier.new);
