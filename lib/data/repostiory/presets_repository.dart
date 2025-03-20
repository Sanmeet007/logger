import 'package:logger/data/datasource/filter_preset_datasource.dart';
import 'package:logger/data/models/filter_preset.dart';
import 'package:logger/utils/filters.dart';

class PresetsRepository {
  final FilterPresetDatasource _datasource;
  PresetsRepository(this._datasource);

  Future<void> addFilterPreset(Filter filter, String name) async {
    try {
      await _datasource.addFilterPreset(filter, name);
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> deleteFilterPresetById(int id) async {
    try {
      await _datasource.deleteFilterPresetById(id);
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

  Future<void> deleteAllPresets() async {
    try {
      await _datasource.dropTable();
    } catch (e) {
      throw '$e';
    }
  }
}
