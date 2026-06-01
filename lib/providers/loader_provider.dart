import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoaderNotifier extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void showLoading() {
    state = true;
  }

  void hideLoading() {
    state = false;
  }
}

final loaderProvider = NotifierProvider<LoaderNotifier, bool>(
  LoaderNotifier.new,
);
