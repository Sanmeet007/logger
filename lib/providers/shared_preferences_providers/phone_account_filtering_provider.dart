import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';

class PhoneAccountFilteringNotifier extends Notifier<bool> {
  @override
  bool build() {
    return ref.watch(sharedUtilityProvider).isPhoneAccountIdFilteringEnabled();
  }

  void toggle() {
    final utility = ref.read(sharedUtilityProvider);
    final isEnabled = utility.isPhoneAccountIdFilteringEnabled();

    utility.togglePhoneAccountIdFiltering(!isEnabled);
    state = utility.isPhoneAccountIdFilteringEnabled();
  }
}

final phoneAccountFilteringProvider =
    NotifierProvider<PhoneAccountFilteringNotifier, bool>(
  PhoneAccountFilteringNotifier.new,
);
