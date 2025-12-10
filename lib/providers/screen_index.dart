import 'package:flutter_riverpod/flutter_riverpod.dart';

class IndexNotifier extends StateNotifier<int> {
  IndexNotifier() : super(0);

  void setIndex(int i) {
    state = i;
  }
}

final screenIndexProvider = StateNotifierProvider<IndexNotifier, int>(
  (ref) => IndexNotifier(),
);
