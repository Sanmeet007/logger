import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';

class CallRoundingNotifier extends Notifier<bool> {
  @override
  bool build() {
    return ref.watch(sharedUtilityProvider).isCallRoundingEnabled();
  }

  void toggle() {
    final utility = ref.read(sharedUtilityProvider);
    final isEnabled = utility.isCallRoundingEnabled();

    utility.toggleCallRounding(!isEnabled);
    state = utility.isCallRoundingEnabled();
  }
}

final callRoundingProvider = NotifierProvider<CallRoundingNotifier, bool>(
  CallRoundingNotifier.new,
);
