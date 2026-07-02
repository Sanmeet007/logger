import 'package:logger/data/models/tracklist_item.dart';
import 'package:logger/screens/tracklist/fragments/tracklist_item_ui.dart';

class TracklistItemUiBuilder {
  static final TracklistItemUiBuilder _instance = TracklistItemUiBuilder._();
  TracklistItemUiBuilder._();
  factory TracklistItemUiBuilder() => _instance;

  final List<TrackListItem> _currentContacts = [];
  final List<TracklistItemUi> _currentTrackListUi = [];

  static bool areListsEqual(List<TrackListItem> a, List<TrackListItem> b) {
    final aSet = a.map((e) => e.contactName).toSet();
    final bSet = b.map((e) => e.contactName).toSet();
    return aSet.length == bSet.length && aSet.containsAll(bSet);
  }

  static List<TrackListItem> getNewItems(
      List<TrackListItem> oldList, List<TrackListItem> newList) {
    final oldSet = oldList.map((e) => e.contactName).toSet();
    return newList.where((e) => !oldSet.contains(e.contactName)).toList();
  }

  List<TracklistItemUi> build(List<TrackListItem> newContacts) {
    if (areListsEqual(_currentContacts, newContacts)) {
      return _currentTrackListUi;
    }

    final newContactSet = newContacts.map((e) => e.contactName).toSet();
    _currentTrackListUi.removeWhere(
      (ui) => !newContactSet.contains(ui.item.contactName),
    );

    final newItems = getNewItems(_currentContacts, newContacts);
    _currentTrackListUi.addAll(
      newItems.map(
        (item) => TracklistItemUi(
          item: item,
        ),
      ),
    );

    _currentContacts
      ..clear()
      ..addAll(newContacts);

    return _currentTrackListUi;
  }

  void clearCache() {
    _currentContacts.clear();
    _currentTrackListUi.clear();
  }
}
