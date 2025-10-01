import 'package:logger/data/models/tracklist_item.dart';
import 'package:logger/screens/tracklist/fragments/tracklist_item_ui.dart';

class TracklistItemUiBuilder {
  static final TracklistItemUiBuilder _instance = TracklistItemUiBuilder._();
  TracklistItemUiBuilder._();
  factory TracklistItemUiBuilder() => _instance;

  final List<TrackListItem> _currentNumbers = [];
  final List<TracklistItemUi> _currentTrackListUi = [];

  static bool areListsEqual(List<TrackListItem> a, List<TrackListItem> b) {
    final aSet = a.map((e) => e.phoneNumber).toSet();
    final bSet = b.map((e) => e.phoneNumber).toSet();
    return aSet.length == bSet.length && aSet.containsAll(bSet);
  }

  static List<TrackListItem> getNewItems(
      List<TrackListItem> oldList, List<TrackListItem> newList) {
    final oldSet = oldList.map((e) => e.phoneNumber).toSet();
    return newList.where((e) => !oldSet.contains(e.phoneNumber)).toList();
  }

  List<TracklistItemUi> build(List<TrackListItem> newNumbers) {
    if (areListsEqual(_currentNumbers, newNumbers)) {
      return _currentTrackListUi;
    }

    final newNumberSet = newNumbers.map((e) => e.phoneNumber).toSet();
    _currentTrackListUi.removeWhere(
      (ui) => !newNumberSet.contains(ui.item.phoneNumber),
    );

    final newItems = getNewItems(_currentNumbers, newNumbers);
    _currentTrackListUi.addAll(
      newItems.map(
        (item) => TracklistItemUi(
          item: item,
        ),
      ),
    );

    _currentNumbers
      ..clear()
      ..addAll(newNumbers);

    return _currentTrackListUi;
  }

  void clearCache() {
    _currentNumbers.clear();
    _currentTrackListUi.clear();
  }
}
