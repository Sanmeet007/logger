import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';

class FilterPresetsUsageNotifier extends Notifier<bool> {
  @override
  bool build() {
    return ref.watch(sharedUtilityProvider).isFilterPresetsEnabled();
  }

  void toggle() {
    final utility = ref.read(sharedUtilityProvider);
    final isEnabled = utility.isFilterPresetsEnabled();

    utility.toggleFilterPresetsUsage(!isEnabled);
    state = utility.isFilterPresetsEnabled();
  }
}

final filterPresetsUsageProvider =
    NotifierProvider<FilterPresetsUsageNotifier, bool>(
  FilterPresetsUsageNotifier.new,
);
