import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';

class FilterGroupingNotifier extends Notifier<bool> {
  @override
  bool build() {
    return ref.watch(sharedUtilityProvider).isFilterGroupingEnabled();
  }

  void setMode(bool value) {
    ref.read(sharedUtilityProvider).toggleFilterGrouping(value);
    state = value;
  }
}

final filterGroupingProvider = NotifierProvider<FilterGroupingNotifier, bool>(
  FilterGroupingNotifier.new,
);
