import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';

final logsSharingProvider =
    StateNotifierProvider<LogsSharingProvider, bool>((ref) {
  return LogsSharingProvider(ref: ref);
});

class LogsSharingProvider extends StateNotifier<bool> {
  LogsSharingProvider({required this.ref}) : super(true) {
    state = ref.watch(sharedUtilityProvider).isLogsSharingEnabled();
  }

  Ref ref;

  void toggle() {
    ref.watch(sharedUtilityProvider).toggleLogsSharing(
          !ref.watch(sharedUtilityProvider).isLogsSharingEnabled(),
        );
    state = ref.watch(sharedUtilityProvider).isLogsSharingEnabled();
  }
}
