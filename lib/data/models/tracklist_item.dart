class TrackListItem {
  final int id;
  final String phoneNumber;

  const TrackListItem({
    this.id = -1,
    required this.phoneNumber,
  });

  static final TrackListItem defaultItem = TrackListItem(
    id: -1,
    phoneNumber: "",
  );

  Map<String, dynamic> toJSON() {
    return {
      "id": id == -1 ? null : id,
      "phone_number": phoneNumber,
    };
  }

  factory TrackListItem.fromJson(Map<String, dynamic> map) {
    return TrackListItem(
      id: map["id"] as int,
      phoneNumber: map["phone_number"] as String,
    );
  }

  factory TrackListItem.fromNumber(String phoneNumber) {
    return TrackListItem(
      phoneNumber: phoneNumber,
    );
  }

  TrackListItem copyWith({
    int? id,
    String? phoneNumber,
  }) {
    return TrackListItem(
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
