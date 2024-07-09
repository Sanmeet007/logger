import 'package:call_log/call_log.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/components/sized_text.dart';
import 'package:logger/components/toggle_button.dart';
import 'package:logger/utils/filters.dart';

class LogFilters extends StatefulWidget {
  final Function() removeFilters;
  final Function(Map) filterLogs;
  final Map currentFilters;
  final bool canFilterUsingDuration;

  const LogFilters({
    super.key,
    required this.currentFilters,
    required this.filterLogs,
    required this.removeFilters,
    required this.canFilterUsingDuration,
  });

  @override
  State<LogFilters> createState() => _LogFiltersState();
}

class _LogFiltersState extends State<LogFilters> {
  final formatter = DateFormat("yyyy-MM-dd");
  List<CallType> callTypes = [...CallType.values];

  late bool isNumberSearchEnabled;
  late bool isDurationFilteringOn;
  late String dateRangeOption;
  late List<CallType> selectedCallTypes;
  late TextEditingController _phoneNumberInputController,
      _startDateController,
      _endDateController,
      _minDurationInputController,
      _maxDurationInputController;

  bool canApplyFilters = false;

  @override
  void initState() {
    super.initState();

    _phoneNumberInputController =
        TextEditingController(text: widget.currentFilters["phone_to_match"]);

    _minDurationInputController = TextEditingController(
        text: widget.currentFilters["min_duration"] ?? "0");
    _maxDurationInputController = TextEditingController(
        text: widget.currentFilters["max_duration"] ?? "");
    _endDateController = TextEditingController(
        text: formatter.format(widget.currentFilters["end_date"]));
    _startDateController = TextEditingController(
        text: formatter.format(widget.currentFilters["start_date"]));

    isNumberSearchEnabled = widget.currentFilters["specific_ph"];
    dateRangeOption = widget.currentFilters["date_range_op"];
    selectedCallTypes = widget.currentFilters["selected_call_types"];
    isDurationFilteringOn = widget.currentFilters["duration_filtering"];
  }

  @override
  void dispose() {
    _phoneNumberInputController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _minDurationInputController.dispose();
    _maxDurationInputController.dispose();
    super.dispose();
  }

  void toggleNumberSearch(bool v) {
    setState(() {
      isNumberSearchEnabled = v;
    });
    checkFiltersState();
  }

  void handleDateRangeOptionChange(String? v) {
    setState(() {
      dateRangeOption = v ?? "All Time";
    });
    checkFiltersState();
  }

  void handleCallTypeChange(CallType t, bool selected) {
    setState(() {
      if (selected) {
        if (!selectedCallTypes.contains(t)) {
          selectedCallTypes = [...selectedCallTypes, t];
        }
      } else {
        if (selectedCallTypes.contains(t)) {
          selectedCallTypes = [...selectedCallTypes];
          selectedCallTypes.remove(t);
        }
      }
    });

    checkFiltersState();
  }

  void setFilterByDurationState(bool v) {
    setState(() {
      isDurationFilteringOn = v;
    });
    checkFiltersState();
  }

  void applyFilters() {
    Navigator.pop(context, true);

    if (shouldApplyFilters()) {
      widget.filterLogs({
        "specific_ph": isNumberSearchEnabled,
        "phone_to_match": _phoneNumberInputController.text,
        "selected_call_types": selectedCallTypes, // \_(^_^)_/
        "date_range_op": dateRangeOption,
        "start_date": _startDateController.text.isEmpty
            ? DateTime.now()
            : DateTime.parse(_startDateController.text),
        "end_date": _endDateController.text.isEmpty
            ? DateTime.now()
            : DateTime.parse(_endDateController.text),
        "min_duration": _minDurationInputController.text,
        "max_duration": _maxDurationInputController.text,
        "duration_filtering": isDurationFilteringOn,
      });
    }
  }

  void clearFilters() {
    Navigator.pop(context, true);
    widget.removeFilters();
  }

  bool shouldApplyFilters() {
    return !Filters.compareFilterMasks({
      "specific_ph": isNumberSearchEnabled,
      "phone_to_match": _phoneNumberInputController.text,
      "selected_call_types": selectedCallTypes, // \_(^_^)_/
      "date_range_op": dateRangeOption,
      "start_date": _startDateController.text.isEmpty
          ? DateTime.now()
          : DateTime.parse(_startDateController.text),
      "end_date": _endDateController.text.isEmpty
          ? DateTime.now()
          : DateTime.parse(_endDateController.text),
      "duration_filtering": isDurationFilteringOn,
      "min_duration": _minDurationInputController.text,
      "max_duration": _maxDurationInputController.text,
    }, widget.currentFilters);
  }

  void checkFiltersState() {
    if (shouldApplyFilters()) {
      setState(() {
        canApplyFilters = true;
      });
    } else {
      setState(() {
        canApplyFilters = false;
      });
    }
  }

  void handlePhoneNumberValueChange(String? v) {
    if (v == null) return;
    if (widget.currentFilters["phone_to_match"] != v) {
      checkFiltersState();
    }
  }

  void handleMinDurationValueChange(String? v) {
    if (v == null) return;
    var k = int.tryParse(v);
    if (k != null && k > 0) {
      if (widget.currentFilters["min_duration"] != v) {
        checkFiltersState();
      }
    }
  }

  void handleMaxDurationValueChange(String? v) {
    if (v == null) return;
    var k = int.tryParse(v);
    if (k != null && k > 0) {
      if (widget.currentFilters["max_duration"] != v) {
        checkFiltersState();
      }
    }
  }

  void handleStartDateChanges(String? v) {
    if (v == null) return;
    if (formatter.format(widget.currentFilters["start_date"]) != v) {
      checkFiltersState();
    }
  }

  void handleEndDateChanges(String? v) {
    if (v == null) return;
    if (formatter.format(widget.currentFilters["end_date"]) != v) {
      checkFiltersState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          color: Theme.of(context).canvasColor,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color.fromARGB(250, 42, 40, 40)
                        : const Color.fromARGB(155, 240, 230, 255),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedText(
                            "Specific phone number",
                            size: 18.0,
                          ),
                          Switch(
                            value: isNumberSearchEnabled,
                            onChanged: toggleNumberSearch,
                          ),
                        ],
                      ),
                      if (isNumberSearchEnabled)
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextField(
                            onChanged: handlePhoneNumberValueChange,
                            controller: _phoneNumberInputController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 66, 66, 66),
                                ),
                              ),
                              label: Text("Mobile Number"),
                              hintText: '9XXXX XXXX',
                            ),
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                if (widget.canFilterUsingDuration)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 15.0,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color.fromARGB(250, 42, 40, 40)
                          : const Color.fromARGB(155, 240, 230, 255),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedText(
                              "Filter by call duration",
                              size: 18.0,
                            ),
                            Switch(
                              value: isDurationFilteringOn,
                              onChanged: setFilterByDurationState,
                            ),
                          ],
                        ),
                        if (isDurationFilteringOn)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              children: [
                                Flexible(
                                  child: TextField(
                                    onChanged: handleMinDurationValueChange,
                                    controller: _minDurationInputController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 66, 66, 66),
                                        ),
                                      ),
                                      label: Text("Min (in secs)"),
                                      hintText: 'eg. 0',
                                    ),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Flexible(
                                  child: TextField(
                                    onChanged: handleMaxDurationValueChange,
                                    controller: _maxDurationInputController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 66, 66, 66),
                                        ),
                                      ),
                                      label: Text("Max (in secs)"),
                                      hintText: 'eg. 60',
                                    ),
                                    keyboardType:
                                        const TextInputType.numberWithOptions(),
                                  ),
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                if (widget.canFilterUsingDuration) const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color.fromARGB(250, 42, 40, 40)
                        : const Color.fromARGB(155, 240, 230, 255),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedText(
                        "Call Type",
                        size: 18.0,
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomToggleButtons(
                        selectedCallTypes: selectedCallTypes,
                        onChange: handleCallTypeChange,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15.0,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color.fromARGB(250, 42, 40, 40)
                        : const Color.fromARGB(155, 240, 230, 255),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedText(
                            "Date range",
                            size: 18.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.0,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color.fromARGB(255, 65, 65, 65)
                                    : Colors.black87,
                              ),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: DropdownButton<String>(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0,
                                  vertical: 10.0,
                                ),
                                isDense: true,
                                underline: Container(),
                                enableFeedback: true,
                                value: dateRangeOption,
                                items: [
                                  ...[
                                    "Today",
                                    "Yesterday",
                                    "This Month",
                                    "Past Month",
                                    "This Year",
                                    "Past Year",
                                    "All Time",
                                    "Custom"
                                  ].map(
                                    (item) => DropdownMenuItem(
                                      value: item,
                                      child: Text(
                                        item,
                                      ),
                                    ),
                                  )
                                ],
                                onChanged: handleDateRangeOptionChange),
                          ),
                        ],
                      ),
                      if (dateRangeOption == "Custom")
                        Column(
                          children: [
                            const SizedBox(
                              height: 15.0,
                            ),
                            DateTimePicker(
                              controller: _startDateController,
                              onChanged: handleStartDateChanges,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.date_range),
                                label: Text("Start Date"),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 66, 66, 66),
                                  ),
                                ),
                              ),
                              dateMask: "EEEE, dd MMMM yyyy",
                              firstDate: DateTime(1995),
                              lastDate: DateTime.now(),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            DateTimePicker(
                              controller: _endDateController,
                              onChanged: handleStartDateChanges,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.date_range),
                                label: Text("End Date"),
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color.fromARGB(255, 66, 66, 66),
                                  ),
                                ),
                              ),
                              dateMask: "EEEE, dd MMMM yyyy",
                              firstDate: DateTime(1995),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 0)),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 15.0),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: clearFilters,
                        child: const Text("Reset to default"),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor:
                              const Color.fromARGB(255, 222, 200, 255),
                        ),
                        onPressed: canApplyFilters ? applyFilters : null,
                        child: const Text("Apply filters"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
