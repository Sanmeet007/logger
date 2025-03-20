import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';

final filterPresetsUsageProvider =
    StateNotifierProvider<FilterPresetsUsageProvider, bool>((ref) {
  return FilterPresetsUsageProvider(ref: ref);
});

class FilterPresetsUsageProvider extends StateNotifier<bool> {
  FilterPresetsUsageProvider({required this.ref}) : super(false) {
    state = ref.watch(sharedUtilityProvider).isFilterPresetsEnabled();
  }

  Ref ref;

  void toggle() {
    ref.watch(sharedUtilityProvider).toggleFilterPresetsUsage(
          !ref.watch(sharedUtilityProvider).isFilterPresetsEnabled(),
        );
    state = ref.watch(sharedUtilityProvider).isFilterPresetsEnabled();
  }
}
