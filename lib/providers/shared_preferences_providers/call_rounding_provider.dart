import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';

final callRoundingProvider =
    StateNotifierProvider<CallRoundingProvider, bool>((ref) {
  return CallRoundingProvider(ref: ref);
});

class CallRoundingProvider extends StateNotifier<bool> {
  CallRoundingProvider({required this.ref}) : super(false) {
    state = ref.watch(sharedUtilityProvider).isCallRoundingEnabled();
  }

  Ref ref;

  void toggle() {
    ref.watch(sharedUtilityProvider).toggleCallRounding(
          !ref.watch(sharedUtilityProvider).isCallRoundingEnabled(),
        );
    state = ref.watch(sharedUtilityProvider).isCallRoundingEnabled();
  }
}
