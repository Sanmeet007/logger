import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';

final durationFilteringProvider =
    StateNotifierProvider<DurationFilteringProvider, bool>((ref) {
  return DurationFilteringProvider(ref: ref);
});

class DurationFilteringProvider extends StateNotifier<bool> {
  DurationFilteringProvider({required this.ref}) : super(false) {
    state = ref.watch(sharedUtilityProvider).isDurationFilteringEnabled();
  }

  Ref ref;

  void toggle() {
    ref.watch(sharedUtilityProvider).toggleDurationFiltering(
          !ref.watch(sharedUtilityProvider).isDurationFilteringEnabled(),
        );
    state = ref.watch(sharedUtilityProvider).isDurationFilteringEnabled();
  }
}
