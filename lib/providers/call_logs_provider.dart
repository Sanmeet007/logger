import 'package:call_log/call_log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class CallLogsNotifier extends AsyncNotifier<Iterable<CallLogEntry>> {
  static List<String>? _cachedAccountIds;

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
    if (_cachedAccountIds != null) {
      return _cachedAccountIds!;
    }

    if (state.value != null) {
      final uniquePhoneAccountIds = <String>{"Any"};
      for (var entry in state.value!) {
        uniquePhoneAccountIds.add(entry.phoneAccountId ?? "Unknown");
      }

      _cachedAccountIds = uniquePhoneAccountIds.toList();
      return _cachedAccountIds!;
    } else {
      return List.empty();
    }
  }
}

final callLogsNotifierProvider =
    AsyncNotifierProvider<CallLogsNotifier, Iterable<CallLogEntry>>(
        CallLogsNotifier.new);
