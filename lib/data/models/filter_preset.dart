import 'package:call_log/call_log.dart';

class FilterPreset {
  final int? id;
  final String? name;
  final bool? usesPhoneAccountId;
  final String? phoneAccountId;
  final bool? usesSpecificPhoneNumber;
  final String? specificPhoneNumber;
  final bool? usesFilterByCallDuration;
  final Duration? callMinDuration;
  final Duration? callMaxDuration;
  final List<CallType>? selectedCallTypes;
  final String? dateRangeType;
  final DateTime? startDate;
  final DateTime? endDate;

  const FilterPreset({
    this.id = 1,
    this.name,
    this.usesPhoneAccountId,
    this.phoneAccountId,
    this.usesSpecificPhoneNumber,
    this.specificPhoneNumber,
    this.usesFilterByCallDuration,
    this.callMinDuration,
    this.callMaxDuration,
    this.selectedCallTypes,
    this.dateRangeType,
    this.startDate,
    this.endDate,
  });

  Map<String, dynamic> toJSON() {
    return {
      "id": "",
      "name": "",
      "uses_phone_account_id": "",
      "phone_account_id": "",
      "uses_specific_phone_number": "",
      "specific_phone_number": "",
      "uses_filter_by_call_duration": "",
      "call_min_duration": "",
      "call_max_duration": "",
      "selected_call_types": "",
      "date_range_type": "",
      "start_date": "",
      "end_date": "",
    };
  }

  factory FilterPreset.fromJson(Map<String, dynamic> map) {
    return FilterPreset(
        // id: map[TaskKeys.id],
        // title: map[TaskKeys.title],
        // note: map[TaskKeys.note],
        // category: TaskCategory.stringToTaskCategory(map[TaskKeys.category]),
        // time: map[TaskKeys.time],
        // date: map[TaskKeys.date],
        // isCompleted: map[TaskKeys.isCompleted] == 1 ? true : false,
        );
  }

  FilterPreset copyWith({
    int? id,
    String? name,
    bool? usesPhoneAccountId,
    String? phoneAccountId,
    bool? usesSpecificPhoneNumber,
    String? specificPhoneNumber,
    bool? usesFilterByCallDuration,
    Duration? callMinDuration,
    Duration? callMaxDuration,
    List<CallType>? selectedCallTypes,
    String? dateRangeType,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return FilterPreset(
        // id: id ?? this.id,
        // title: title ?? this.title,
        // note: note ?? this.note,
        // category: category ?? this.category,
        // time: time ?? this.time,
        // date: date ?? this.date,
        // isCompleted: isCompleted ?? this.isCompleted,
        );
  }
}
