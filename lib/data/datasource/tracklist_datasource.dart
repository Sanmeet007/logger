import 'package:logger/data/datasource/datasource.dart';
import 'package:logger/data/models/tracklist_item.dart';
import 'package:sqflite/sqflite.dart';

class TrackListDatasource {
  static const tableName = "tracklist";
  final Datasource _ds = Datasource();

  static final TrackListDatasource _instance = TrackListDatasource._();
  factory TrackListDatasource() => _instance;

  TrackListDatasource._();

  Future<int> registerNumber(String phoneNumber) async {
    final db = await _ds.database;

    return db.transaction((txn) async {
      return await txn.insert(
        tableName,
        TrackListItem.fromNumber(phoneNumber).toJSON(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<int> registerNumberIfNotPresent(String phoneNumber) async {
    final db = await _ds.database;

    return db.transaction((txn) async {
      final List<Map<String, dynamic>> maps = await txn.query(
        tableName,
        where: "phone_number = ?",
        whereArgs: [phoneNumber],
      );

      if (maps.isNotEmpty) {
        throw Exception("Phone number already registered");
      }

      return await txn.insert(
        tableName,
        TrackListItem.fromNumber(phoneNumber).toJSON(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<List<TrackListItem>> getNumbers() async {
    final db = await _ds.database;
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      orderBy: "creation_timestamp ASC",
    );
    return List.generate(
      maps.length,
      (index) {
        return TrackListItem.fromJson(maps[index]);
      },
    );
  }

  Future<int> removeNumberById(int id) async {
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
