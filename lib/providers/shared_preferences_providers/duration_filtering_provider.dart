import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';

class DurationFilteringNotifier extends Notifier<bool> {
  @override
  bool build() {
    return ref.watch(sharedUtilityProvider).isDurationFilteringEnabled();
  }

  void toggle() {
    final utility = ref.read(sharedUtilityProvider);
    final isEnabled = utility.isDurationFilteringEnabled();

    utility.toggleDurationFiltering(!isEnabled);
    state = utility.isDurationFilteringEnabled();
  }
}

final durationFilteringProvider =
    NotifierProvider<DurationFilteringNotifier, bool>(
  DurationFilteringNotifier.new,
);
