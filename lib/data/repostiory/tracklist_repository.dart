import 'package:logger/data/datasource/tracklist_datasource.dart';
import 'package:logger/data/models/tracklist_item.dart';

class TrackListRepository {
  final TrackListDatasource _datasource;
  TrackListRepository(this._datasource);

  Future<void> registerContact(String contactName) async {
    try {
      await _datasource.registerContact(contactName);
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> registerContactIfNotPresent(String contactName) async {
    try {
      await _datasource.registerContactIfNotPresent(contactName);
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> removeContactById(int id) async {
    try {
      await _datasource.removeContactById(id);
    } catch (e) {
      throw '$e';
    }
  }

  Future<List<TrackListItem>> getContacts() async {
    try {
      return await _datasource.getContacts();
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
