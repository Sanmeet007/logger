import 'package:logger/data/datasource/filter_preset_datasource.dart';
import 'package:logger/data/datasource/tracklist_datasource.dart';
import 'package:sqflite/sqflite.dart';

class Datasource {
  static const dbName = 'com.logger.app.db';
  static Database? _database;

  static final Datasource _instance = Datasource._();
  factory Datasource() => _instance;

  Datasource._() {
    _initDb();
  }

  Future<Database> get database async {
    _database ??= await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    return await openDatabase(
      dbName,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS ${FilterPresetDatasource.tableName} (
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

    await db.execute('''
    CREATE TABLE IF NOT EXISTS ${TrackListDatasource.tableName} (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      phone_number TEXT UNIQUE,
      creation_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
    )
  ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
      CREATE TABLE tracklist (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        phone_number TEXT UNIQUE,
        creation_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
      )
    ''');
    }
  }

  Future<void> drop() async {
    await databaseFactory.deleteDatabase(dbName);
  }
}
