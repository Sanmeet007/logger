import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/data/models/tracklist_item.dart';
import 'package:logger/data/repostiory/tracklist_repository_provider.dart';

class TrackListNotifier extends AsyncNotifier<List<TrackListItem>> {
  @override
  Future<List<TrackListItem>> build() async {
    return ref.watch(trackListRepositoryProvider).getNumbers();
  }

  Future<void> registerNumber(String phoneNumber) async {
    await ref.read(trackListRepositoryProvider).registerNumber(phoneNumber);
    await _updateState();
  }

  Future<void> registerNumberIfNotPresent(String phoneNumber) async {
    await ref
        .read(trackListRepositoryProvider)
        .registerNumberIfNotPresent(phoneNumber);
    await _updateState();
  }

  Future<void> removeNumberById(int id) async {
    await ref.read(trackListRepositoryProvider).removeNumberById(id);
    await _updateState();
  }

  Future<void> refreshPresets() async {
    await _updateState();
  }

  Future<void> purge() async {
    await ref.read(trackListRepositoryProvider).deleteAll();
    await _updateState();
  }

  Future<void> _updateState() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(trackListRepositoryProvider).getNumbers(),
    );
  }
}

final trackListProvider =
    AsyncNotifierProvider<TrackListNotifier, List<TrackListItem>>(() {
  return TrackListNotifier();
});
