import 'package:call_log/call_log.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:logger/components/sized_text.dart';

class LogFilters extends StatelessWidget {
  const LogFilters({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Set<CallType> _segmentedButtonSelection = {...CallType.values};
    bool enableSpecificNumber = false;
    List<CallType> callTypes = [...CallType.values];

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
                const SizedText(
                  "Filters",
                  size: 25.0,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 0.0),
                  padding: const EdgeInsets.all(15.0),
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
                            size: 15.0,
                          ),
                          Switch(
                            value: true,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 66, 66, 66),
                            ),
                          ),
                          hintText: 'Mobile Number',
                        ),
                        keyboardType: TextInputType.numberWithOptions(),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 0.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedText(
                        "Call Type",
                        size: 15.0,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Column(
                        children: [
                          ...callTypes.sublist(0, 3).map(
                                (item) => CheckboxListTile(
                                  value: true,
                                  onChanged: (value) {
                                    // setState(() {
                                    //   isChecked = value!;
                                    // });
                                  },
                                  title: Text(
                                    item.toString(),
                                  ),
                                ),
                              )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 0.0),
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
                            size: 15.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1.0, color: Colors.white10),
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 0.0,
                            ),
                            child: DropdownButton<String>(
                                underline: Container(),
                                enableFeedback: true,
                                value: "This Month",
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
                                      child: Text(item),
                                    ),
                                  )
                                ],
                                onChanged: (value) {}),
                          ),
                        ],
                      ),
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
                        lastDate: DateTime.now().add(const Duration(days: 365)),
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
                        lastDate: DateTime.now().add(const Duration(days: 0)),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Text("Apply Filters")),
                const ElevatedButton(
                    onPressed: null, child: Text("Remove Filters")),
              ],
            ),
          )),
    );
  }
}
