import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';
import 'package:logger/utils/grouper.dart';

class GroupedCallsTypeNotifier extends Notifier<GroupBy> {
  @override
  GroupBy build() {
    return ref.watch(sharedUtilityProvider).getGroupedCallsType();
  }

  void setMode(GroupBy gpBy) {
    ref.read(sharedUtilityProvider).setGroupedCallsType(gpBy);
    state = gpBy;
  }
}

final groupedCallsTypeProvider =
    NotifierProvider<GroupedCallsTypeNotifier, GroupBy>(
  GroupedCallsTypeNotifier.new,
);
