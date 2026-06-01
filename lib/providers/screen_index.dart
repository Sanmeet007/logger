import 'package:flutter_riverpod/flutter_riverpod.dart';

class IndexNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void setIndex(int i) {
    state = i;
  }
}

final screenIndexProvider = NotifierProvider<IndexNotifier, int>(
  IndexNotifier.new,
);
