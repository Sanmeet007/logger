import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/providers/shared_utility_provider.dart';
import 'package:logger/utils/grouper.dart';

final groupedCallsTypeProvider =
    StateNotifierProvider<GroupedCallsTypeProvider, GroupBy>((ref) {
  return GroupedCallsTypeProvider(ref: ref);
});

class GroupedCallsTypeProvider extends StateNotifier<GroupBy> {
  GroupedCallsTypeProvider({required this.ref}) : super(GroupBy.none) {
    state = ref.watch(sharedUtilityProvider).getGroupedCallsType();
  }

  Ref ref;

  void setMode(GroupBy gpBy) {
    ref.watch(sharedUtilityProvider).setGroupedCallsType(gpBy);
    state = gpBy;
  }
}
