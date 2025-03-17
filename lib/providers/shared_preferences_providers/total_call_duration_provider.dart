import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';

final totalCallDurationProvider =
    StateNotifierProvider<TotalCallDurationProvider, bool>((ref) {
  return TotalCallDurationProvider(ref: ref);
});

class TotalCallDurationProvider extends StateNotifier<bool> {
  TotalCallDurationProvider({required this.ref}) : super(false) {
    state = ref.watch(sharedUtilityProvider).isTotalCallDurationEnabled();
  }

  Ref ref;

  void toggle() {
    ref.watch(sharedUtilityProvider).toggleTotalCallDuration(
          !ref.watch(sharedUtilityProvider).isTotalCallDurationEnabled(),
        );
    state = ref.watch(sharedUtilityProvider).isTotalCallDurationEnabled();
  }
}
