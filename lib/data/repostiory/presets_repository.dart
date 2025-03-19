import 'package:logger/data/datasource/filter_preset_datasource.dart';
import 'package:logger/data/models/filter_preset.dart';

class PresetsRepository {
  final FilterPresetDatasource _datasource;
  PresetsRepository(this._datasource);

  Future<void> addFilterPreset(FilterPreset preset) async {
    try {
      await _datasource.addFilterPreset(preset);
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> deleteFilterPreset(FilterPreset preset) async {
    try {
      await _datasource.deleteFilterPreset(preset);
    } catch (e) {
      throw '$e';
    }
  }

  Future<List<FilterPreset>> getAllFilterPresets() async {
    try {
      return await _datasource.getAllFilterPresets();
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> updateFilterPreset(FilterPreset preset) async {
    try {
      await _datasource.updateFilterPreset(preset);
    } catch (e) {
      throw '$e';
    }
  }
}
