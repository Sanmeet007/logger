import 'package:logger/data/datasource/datasource.dart';
import 'package:logger/data/models/filter_preset.dart';
import 'package:logger/utils/filters.dart';
import 'package:sqflite/sqflite.dart';

class FilterPresetDatasource {
  static const tableName = "filter_presets";
  final Datasource _ds = Datasource();

  static final FilterPresetDatasource _instance = FilterPresetDatasource._();
  factory FilterPresetDatasource() => _instance;

  FilterPresetDatasource._();

  Future<int> addFilterPreset(Filter filter, String name) async {
    final db = await _ds.database;

    return db.transaction((txn) async {
      return await txn.insert(
        tableName,
        FilterPreset.fromFilter(filter, name).toJSON(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<FilterPreset> getPresetById(int id) async {
    final db = await _ds.database;
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) return FilterPreset.defaultPreset;
    return FilterPreset.fromJson(maps[0]);
  }

  Future<List<FilterPreset>> getAllFilterPresets() async {
    final db = await _ds.database;
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      orderBy: "id DESC",
    );
    return List.generate(
      maps.length,
      (index) {
        return FilterPreset.fromJson(maps[index]);
      },
    );
  }

  Future<int> updateFilterPreset(FilterPreset preset) async {
    final db = await _ds.database;
    return db.transaction((txn) async {
      return await txn.update(
        tableName,
        preset.toJSON(),
        where: 'id = ?',
        whereArgs: [preset.id],
      );
    });
  }

  Future<int> deleteFilterPresetById(int id) async {
    final db = await _ds.database;
    return db.transaction(
      (txn) async {
        return await txn.delete(
          tableName,
          where: 'id = ?',
          whereArgs: [id],
        );
      },
    );
  }

  Future<void> dropTable() async {
    final db = await _ds.database;
    db.delete(tableName);
  }
}
