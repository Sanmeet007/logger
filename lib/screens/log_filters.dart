import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:logger/components/sized_text.dart';

class LogFilters extends StatelessWidget {
  const LogFilters({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Set<int> _segmentedButtonSelection = {1};

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
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.greenAccent, width: 5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 66, 66, 66),
                                width: 1.0),
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
                      SizedBox(
                        width: double.infinity,
                        child: SegmentedButton<int>(
                          style: ButtonStyle(
                            side: WidgetStateProperty.all<BorderSide>(
                              const BorderSide(
                                color: Color.fromARGB(255, 54, 53, 53),
                              ),
                            ),
                            backgroundColor:
                                WidgetStateProperty.resolveWith<Color>(
                              (Set<WidgetState> states) {
                                if (states.contains(WidgetState.selected)) {
                                  return const Color.fromARGB(
                                      255, 239, 200, 255);
                                }
                                return Colors.transparent;
                              },
                            ),
                          ),
                          showSelectedIcon: false,
                          emptySelectionAllowed: false,
                          multiSelectionEnabled: true,
                          segments: const <ButtonSegment<int>>[
                            ButtonSegment(
                              value: 0,
                              label: Text(
                                "Missed",
                              ),
                            ),
                            ButtonSegment(
                              value: 1,
                              label: Text(
                                "Incoming",
                              ),
                            ),
                            ButtonSegment(
                              value: 0,
                              label: Text(
                                "Outgoing",
                              ),
                            ),
                          ],
                          selected: _segmentedButtonSelection,
                          onSelectionChanged: (Set<int> newSelection) {
                            // this.setState(() {
                            //   _segmentedButtonSelection = newSelection;
                            // });
                          },
                        ),
                      ),
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
                      DateTimePicker(),
                      DateTimePicker(),
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
