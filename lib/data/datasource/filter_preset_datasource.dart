import 'package:logger/data/models/filter_preset.dart';
import 'package:logger/utils/filters.dart';
import 'package:sqflite/sqflite.dart';

class FilterPresetDatasource {
  static const _dbName = 'com.logger.app.db';
  static const _tableName = "filter_presets";

  static final FilterPresetDatasource _instance = FilterPresetDatasource._();
  factory FilterPresetDatasource() => _instance;

  FilterPresetDatasource._() {
    _initDb();
  }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    return await openDatabase(
      _dbName,
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        phone_account_id TEXT,
        uses_specific_phone_number INTEGER DEFAULT 0,
        specific_phone_number TEXT,
        uses_filter_by_call_duration INTEGER DEFAULT 0,
        call_min_duration INTEGER,
        call_max_duration INTEGER,
        selected_call_types TEXT,
        date_range_option INTEGER,
        start_date TEXT,
        end_date TEXT,
        creation_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
      )
    ''');
  }

  Future<int> addFilterPreset(Filter filter, String name) async {
    final db = await database;

    return db.transaction((txn) async {
      return await txn.insert(
        _tableName,
        FilterPreset.fromFilter(filter, name).toJSON(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<List<FilterPreset>> getAllFilterPresets() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      _tableName,
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
    final db = await database;
    return db.transaction((txn) async {
      return await txn.update(
        _tableName,
        preset.toJSON(),
        where: 'id = ?',
        whereArgs: [preset.id],
      );
    });
  }

  Future<int> deleteFilterPresetById(int id) async {
    final db = await database;
    return db.transaction(
      (txn) async {
        return await txn.delete(
          _tableName,
          where: 'id = ?',
          whereArgs: [id],
        );
      },
    );
  }

  Future<void> dropTable() async {
    final db = await database;
    db.delete(_tableName);
  }

  Future<void> drop() async {
    await databaseFactory.deleteDatabase(_dbName);
  }
}
