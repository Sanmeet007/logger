class TrackListItem {
  final int id;
  final String contactName;

  const TrackListItem({
    this.id = -1,
    required this.contactName,
  });

  static final TrackListItem defaultItem = TrackListItem(
    id: -1,
    contactName: "",
  );

  Map<String, dynamic> toJSON() {
    return {
      "id": id == -1 ? null : id,
      "contact_name": contactName,
    };
  }

  factory TrackListItem.fromJson(Map<String, dynamic> map) {
    return TrackListItem(
      id: map["id"] as int,
      contactName: map["contact_name"] as String,
    );
  }

  factory TrackListItem.fromName(String contactName) {
    return TrackListItem(
      contactName: contactName,
    );
  }

  TrackListItem copyWith({
    int? id,
    String? contactName,
  }) {
    return TrackListItem(
      id: id ?? this.id,
      contactName: contactName ?? this.contactName,
    );
  }
}
