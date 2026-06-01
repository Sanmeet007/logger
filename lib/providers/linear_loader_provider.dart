import 'package:flutter_riverpod/flutter_riverpod.dart';

class LinearLoaderState {
  final String message;
  final bool currentState;

  const LinearLoaderState({required this.message, required this.currentState});
}

class LinearLoaderNotifier extends Notifier<LinearLoaderState> {
  @override
  LinearLoaderState build() {
    return const LinearLoaderState(message: "", currentState: false);
  }

  void showLoading(String message) {
    state = LinearLoaderState(message: message, currentState: true);
  }

  void hideLoading() {
    state = LinearLoaderState(message: "", currentState: false);
  }
}

final linearLoaderProvider =
    NotifierProvider<LinearLoaderNotifier, LinearLoaderState>(
  LinearLoaderNotifier.new,
);
