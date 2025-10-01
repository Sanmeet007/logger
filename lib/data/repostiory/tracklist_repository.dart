import 'package:logger/data/datasource/tracklist_datasource.dart';
import 'package:logger/data/models/tracklist_item.dart';

class TrackListRepository {
  final TrackListDatasource _datasource;
  TrackListRepository(this._datasource);

  Future<void> registerNumber(String phoneNumber) async {
    try {
      await _datasource.registerNumber(phoneNumber);
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> registerNumberIfNotPresent(String phoneNumber) async {
    try {
      await _datasource.registerNumberIfNotPresent(phoneNumber);
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> removeNumberById(int id) async {
    try {
      await _datasource.removeNumberById(id);
    } catch (e) {
      throw '$e';
    }
  }

  Future<List<TrackListItem>> getNumbers() async {
    try {
      return await _datasource.getNumbers();
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> deleteAll() async {
    try {
      await _datasource.dropTable();
    } catch (e) {
      throw '$e';
    }
  }
}
