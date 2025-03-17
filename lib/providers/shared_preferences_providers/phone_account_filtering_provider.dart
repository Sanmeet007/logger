import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';

final phoneAccountFilteringProvider =
    StateNotifierProvider<PhoneAccountFilteringProvider, bool>((ref) {
  return PhoneAccountFilteringProvider(ref: ref);
});

class PhoneAccountFilteringProvider extends StateNotifier<bool> {
  PhoneAccountFilteringProvider({required this.ref}) : super(false) {
    state = ref.watch(sharedUtilityProvider).isPhoneAccountIdFilteringEnabled();
  }

  Ref ref;

  void toggle() {
    ref.watch(sharedUtilityProvider).togglePhoneAccountIdFiltering(
          !ref.watch(sharedUtilityProvider).isPhoneAccountIdFilteringEnabled(),
        );
    state = ref.watch(sharedUtilityProvider).isPhoneAccountIdFilteringEnabled();
  }
}
