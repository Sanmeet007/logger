import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';

final filterGroupingProvider =
    StateNotifierProvider<FilterGroupingProvider, bool>((ref) {
  return FilterGroupingProvider(ref: ref);
});

class FilterGroupingProvider extends StateNotifier<bool> {
  FilterGroupingProvider({required this.ref}) : super(false) {
    state = ref.watch(sharedUtilityProvider).isFilterGroupingEnabled();
  }

  Ref ref;

  void setMode(bool value) {
    ref.watch(sharedUtilityProvider).toggleFilterGrouping(value);
    state = value;
  }
}
