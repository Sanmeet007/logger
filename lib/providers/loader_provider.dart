import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoaderNotifier extends StateNotifier<bool> {
  LoaderNotifier() : super(false);

  void showLoading() {
    state = true;
  }

  void hideLoading() {
    state = false;
  }
}

final loaderProvider = StateNotifierProvider<LoaderNotifier, bool>(
  (ref) => LoaderNotifier(),
);
