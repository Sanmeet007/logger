import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';

class OnboardingNotifier extends Notifier<bool> {
  @override
  bool build() {
    return ref.watch(sharedUtilityProvider).isOnboardingComplete();
  }

  void markComplete() {
    final utility = ref.read(sharedUtilityProvider);

    utility.markOnboardingComplete();
    state = utility.isOnboardingComplete();
  }
}

final onboardingProvider = NotifierProvider<OnboardingNotifier, bool>(
  OnboardingNotifier.new,
);
