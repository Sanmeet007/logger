import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';

class DownloadConfirmationNotifier extends Notifier<bool> {
  @override
  bool build() {
    return ref.watch(sharedUtilityProvider).isConfirmDownloadEnabled();
  }

  void toggle() {
    final utility = ref.read(sharedUtilityProvider);
    final isEnabled = utility.isConfirmDownloadEnabled();

    utility.toggleConfirmDownload(!isEnabled);
    state = utility.isConfirmDownloadEnabled();
  }
}

final downloadConfirmationProvider =
    NotifierProvider<DownloadConfirmationNotifier, bool>(
  DownloadConfirmationNotifier.new,
);
