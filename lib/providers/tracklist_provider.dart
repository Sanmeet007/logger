import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/data/models/tracklist_item.dart';
import 'package:logger/data/repostiory/tracklist_repository_provider.dart';

class TrackListNotifier extends AsyncNotifier<List<TrackListItem>> {
  @override
  Future<List<TrackListItem>> build() async {
    return ref.watch(trackListRepositoryProvider).getContacts();
  }

  Future<void> registerContact(String contactName) async {
    await ref.read(trackListRepositoryProvider).registerContact(contactName);
    await _updateState();
  }

  Future<void> registerContactIfNotPresent(String contactName) async {
    await ref
        .read(trackListRepositoryProvider)
        .registerContactIfNotPresent(contactName);
    await _updateState();
  }

  Future<void> removeContactById(int id) async {
    await ref.read(trackListRepositoryProvider).removeContactById(id);
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
      () => ref.read(trackListRepositoryProvider).getContacts(),
    );
  }
}

final trackListProvider =
    AsyncNotifierProvider<TrackListNotifier, List<TrackListItem>>(() {
  return TrackListNotifier();
});
