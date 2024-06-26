import 'package:call_log/call_log.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:logger/components/sized_text.dart';
import 'package:logger/components/toggle_button.dart';

class LogFilters extends StatefulWidget {
  const LogFilters({
    super.key,
  });

  @override
  State<LogFilters> createState() => _LogFiltersState();
}

class _LogFiltersState extends State<LogFilters> {
  bool isNumberSearchEnabled = false;
  String dateRangeOption = "All Time";

  List<CallType> callTypes = [...CallType.values];

  TextEditingController _phoneNumberInputController =
      TextEditingController(text: "");

  void toggleNumberSearch(bool v) {
    setState(() {
      isNumberSearchEnabled = v;
    });
  }

  void handleDateRangeOptionChange(String? v) {
    setState(() {
      dateRangeOption = v ?? "All Time";
    });
  }

  @override
  void initState() {
    super.initState();
    _phoneNumberInputController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneNumberInputController.dispose();
    super.dispose();
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
                    color: Colors.black38,
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
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedText(
                        "Call Type",
                        size: 18.0,
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      CustomToggleButtons()
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: Colors.black38,
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
                              border:
                                  Border.all(width: 1.0, color: Colors.white10),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 10.0,
                            ),
                            child: DropdownButton<String>(
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
                              lastDate:
                                  DateTime.now().add(const Duration(days: 365)),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            DateTimePicker(
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
                        backgroundColor: const Color.fromARGB(255, 79, 69, 81)),
                    onPressed: () {},
                    child: const Text("Apply Filters")),
                const ElevatedButton(
                    onPressed: null, child: Text("Remove Filters")),
              ],
            ),
          )),
    );
  }
}
