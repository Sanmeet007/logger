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

  const LogFilters({
    super.key,
    required this.currentFilters,
    required this.filterLogs,
    required this.removeFilters,
  });

  @override
  State<LogFilters> createState() => _LogFiltersState();
}

class _LogFiltersState extends State<LogFilters> {
  final formatter = DateFormat("yyyy-MM-dd");
  List<CallType> callTypes = [...CallType.values];

  late bool isNumberSearchEnabled;
  late String dateRangeOption;
  late List<CallType> selectedCallTypes;
  late TextEditingController _phoneNumberInputController,
      _startDateController,
      _endDateController;

  bool canApplyFilters = false;

  @override
  void initState() {
    super.initState();

    _phoneNumberInputController =
        TextEditingController(text: widget.currentFilters["phone_to_match"]);
    _endDateController = TextEditingController(
        text: formatter.format(widget.currentFilters["end_date"]));
    _startDateController = TextEditingController(
        text: formatter.format(widget.currentFilters["start_date"]));

    isNumberSearchEnabled = widget.currentFilters["specific_ph"];
    dateRangeOption = widget.currentFilters["date_range_op"];
    selectedCallTypes = widget.currentFilters["selected_call_types"];
  }

  @override
  void dispose() {
    _phoneNumberInputController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
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
            : DateTime.parse(_endDateController.text)
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
          : DateTime.parse(_endDateController.text)
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
            padding: const EdgeInsets.all(20.0),
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: const Color.fromARGB(255, 222, 200, 255),
                  ),
                  onPressed: canApplyFilters ? applyFilters : null,
                  child: const Text("Apply filters"),
                ),
                OutlinedButton(
                  onPressed: clearFilters,
                  child: const Text("Reset to default"),
                ),
              ],
            ),
          )),
    );
  }
}
