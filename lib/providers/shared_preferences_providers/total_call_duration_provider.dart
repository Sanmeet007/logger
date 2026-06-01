import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';

class TotalCallDurationNotifier extends Notifier<bool> {
  @override
  bool build() {
    return ref.watch(sharedUtilityProvider).isTotalCallDurationEnabled();
  }

  void toggle() {
    final utility = ref.read(sharedUtilityProvider);
    final isEnabled = utility.isTotalCallDurationEnabled();

    utility.toggleTotalCallDuration(!isEnabled);
    state = utility.isTotalCallDurationEnabled();
  }
}

final totalCallDurationProvider =
    NotifierProvider<TotalCallDurationNotifier, bool>(
  TotalCallDurationNotifier.new,
);
