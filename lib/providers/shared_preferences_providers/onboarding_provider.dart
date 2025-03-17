import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';

final onboardingProvider =
    StateNotifierProvider<OnboardingProvider, bool>((ref) {
  return OnboardingProvider(ref: ref);
});

class OnboardingProvider extends StateNotifier<bool> {
  OnboardingProvider({required this.ref}) : super(true) {
    state = ref.watch(sharedUtilityProvider).isOnboardingComplete();
  }

  Ref ref;

  void markComplete() {
    ref.watch(sharedUtilityProvider).markOnboardingComplete();
    state = ref.watch(sharedUtilityProvider).isOnboardingComplete();
  }
}
