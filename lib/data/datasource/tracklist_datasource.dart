import 'package:logger/data/datasource/datasource.dart';
import 'package:logger/data/models/tracklist_item.dart';
import 'package:sqflite/sqflite.dart';

class TrackListDatasource {
  static const tableName = "tracklist";
  final Datasource _ds = Datasource();

  static final TrackListDatasource _instance = TrackListDatasource._();
  factory TrackListDatasource() => _instance;

  TrackListDatasource._();

  Future<int> registerContact(String contactName) async {
    final db = await _ds.database;

    return db.transaction((txn) async {
      return await txn.insert(
        tableName,
        TrackListItem.fromName(contactName).toJSON(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<int> registerContactIfNotPresent(String contactName) async {
    final db = await _ds.database;

    return db.transaction((txn) async {
      final List<Map<String, dynamic>> maps = await txn.query(
        tableName,
        where: "contact_name = ?",
        whereArgs: [contactName],
      );

      if (maps.isNotEmpty) {
        throw Exception("Contact already registered");
      }

      return await txn.insert(
        tableName,
        TrackListItem.fromName(contactName).toJSON(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    });
  }

  Future<List<TrackListItem>> getContacts() async {
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

  Future<int> removeContactById(int id) async {
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
