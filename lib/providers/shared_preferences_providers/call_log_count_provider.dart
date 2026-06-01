import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';

class CallLogCountNotifier extends Notifier<bool> {
  @override
  bool build() {
    return ref.watch(sharedUtilityProvider).isCallLogCountVisible();
  }

  // 3. Methods MUST use ref.read(), never ref.watch()
  void toggle() {
    final utility = ref.read(sharedUtilityProvider);
    final isVisible = utility.isCallLogCountVisible();

    utility.toggleCallLogCountVisibility(!isVisible);
    state = utility.isCallLogCountVisible();
  }
}

final callLogCountProvider = NotifierProvider<CallLogCountNotifier, bool>(
  CallLogCountNotifier.new,
);
