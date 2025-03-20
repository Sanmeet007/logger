import 'package:call_log/call_log.dart';
import 'package:logger/utils/filters.dart';

class FilterPreset {
  final int id;
  final String? name;
  final Filter filterDetails;

  const FilterPreset({
    this.id = -1,
    this.name,
    required this.filterDetails,
  });

  Map<String, dynamic> toJSON() {
    return {
      "id": id,
      "name": name,
      "phone_account_id": filterDetails.phoneAccountId,
      "uses_specific_phone_number": filterDetails.usesSpecificPhoneNumber,
      "specific_phone_number": filterDetails.phoneToMatch,
      "uses_filter_by_call_duration": filterDetails.usesDurationFiltering,
      "call_min_duration": filterDetails.minDuration.inSeconds,
      "call_max_duration": filterDetails.maxDuration?.inSeconds,
      "selected_call_types":
          filterDetails.selectedCallTypes.map((e) => e.index).toList(),
      "date_range_option": filterDetails.dateRangeOption,
      "start_date": filterDetails.startDate.toIso8601String(),
      "end_date": filterDetails.endDate.toIso8601String(),
    };
  }

  factory FilterPreset.fromJson(Map<String, dynamic> map) {
    return FilterPreset(
      id: map["id"],
      name: map["name"],
      filterDetails: Filter(
        phoneAccountId: map["phone_account_id"],
        usesSpecificPhoneNumber: map["uses_specific_phone_number"] ?? false,
        phoneToMatch: map["specific_phone_number"],
        usesDurationFiltering: map["uses_filter_by_call_duration"] ?? false,
        minDuration: Duration(seconds: map["call_min_duration"] ?? 0),
        maxDuration: map["call_max_duration"] != null
            ? Duration(seconds: map["call_max_duration"])
            : null,
        selectedCallTypes: (map["selected_call_types"] as List<dynamic>?)
            ?.map((e) => CallType.values[e])
            .toList(),
        dateRangeOption: map["date_range_option"],
        startDate: map["start_date"] != null
            ? DateTime.parse(map["start_date"])
            : null,
        endDate:
            map["end_date"] != null ? DateTime.parse(map["end_date"]) : null,
      ),
    );
  }

  FilterPreset copyWith({
    int? id,
    String? name,
    Filter? filterDetails,
  }) {
    return FilterPreset(
      id: id ?? this.id,
      name: name ?? this.name,
      filterDetails: filterDetails ?? this.filterDetails,
    );
  }
}
