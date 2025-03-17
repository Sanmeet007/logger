import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';

final callLogCountProvider =
    StateNotifierProvider<CallLogCountProvider, bool>((ref) {
  return CallLogCountProvider(ref: ref);
});

class CallLogCountProvider extends StateNotifier<bool> {
  CallLogCountProvider({required this.ref}) : super(false) {
    state = ref.watch(sharedUtilityProvider).isCallLogCountVisible();
  }

  Ref ref;

  void toggle() {
    ref.watch(sharedUtilityProvider).toggleCallLogCountVisibility(
          !ref.watch(sharedUtilityProvider).isCallLogCountVisible(),
        );
    state = ref.watch(sharedUtilityProvider).isCallLogCountVisible();
  }
}
