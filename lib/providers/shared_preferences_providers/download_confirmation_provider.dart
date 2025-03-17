import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';

final downloadConfirmationProvider =
    StateNotifierProvider<DownloadConfirmationProvider, bool>((ref) {
  return DownloadConfirmationProvider(ref: ref);
});

class DownloadConfirmationProvider extends StateNotifier<bool> {
  DownloadConfirmationProvider({required this.ref}) : super(true) {
    state = ref.watch(sharedUtilityProvider).isConfirmDownloadEnabled();
  }

  Ref ref;

  void toggle() {
    ref.watch(sharedUtilityProvider).toggleConfirmDownload(
          !ref.watch(sharedUtilityProvider).isConfirmDownloadEnabled(),
        );
    state = ref.watch(sharedUtilityProvider).isConfirmDownloadEnabled();
  }
}
