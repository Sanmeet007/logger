import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/data/models/filter_preset.dart';
import 'package:logger/data/repostiory/preset_repository_provider.dart';
import 'package:logger/utils/filters.dart';

class FilterPresetsNotifier extends AsyncNotifier<List<FilterPreset>> {
  @override
  Future<List<FilterPreset>> build() async {
    return ref.watch(filterPresetsRepositoryProvider).getAllFilterPresets();
  }

  Future<void> deleteFilterPresetById(int id) async {
    await ref.read(filterPresetsRepositoryProvider).deleteFilterPresetById(id);
    await _updateState();
  }

  Future<FilterPreset> getPresetById(int id) async {
    return ref.read(filterPresetsRepositoryProvider).getPresetById(id);
  }

  Future<void> addFilterPreset(Filter filter, String name) async {
    await ref
        .read(filterPresetsRepositoryProvider)
        .addFilterPreset(filter, name);
    await _updateState();
  }

  Future<void> updateFilterPreset(FilterPreset preset) async {
    await ref.read(filterPresetsRepositoryProvider).updateFilterPreset(preset);
    await _updateState();
  }

  Future<void> refreshPresets() async {
    await _updateState();
  }

  Future<void> purge() async {
    await ref.read(filterPresetsRepositoryProvider).deleteAllPresets();
    await _updateState();
  }

  Future<void> _updateState() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(filterPresetsRepositoryProvider).getAllFilterPresets(),
    );
  }
}

final filterPresetsProvider =
    AsyncNotifierProvider<FilterPresetsNotifier, List<FilterPreset>>(() {
  return FilterPresetsNotifier();
});
