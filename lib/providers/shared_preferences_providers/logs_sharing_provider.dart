import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';

// 1. Extend Notifierbool> instead of StateNotifier
class LogsSharingNotifier extends Notifier<bool> {
  @override
  bool build() {
    return ref.watch(sharedUtilityProvider).isLogsSharingEnabled();
  }

  void toggle() {
    final utility = ref.read(sharedUtilityProvider);
    final isEnabled = utility.isLogsSharingEnabled();

    utility.toggleLogsSharing(!isEnabled);
    state = utility.isLogsSharingEnabled();
  }
}

final logsSharingProvider = NotifierProvider<LogsSharingNotifier, bool>(
  LogsSharingNotifier.new,
);
