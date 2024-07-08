import 'package:flutter/material.dart';
import 'package:logger/components/sized_text.dart';
import 'package:logger/screens/ExportInfo/field_builder.dart';

class CsvFieldsInformation extends StatelessWidget {
  const CsvFieldsInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 0.0,
        bottom: 20.0,
        left: 20.0,
        right: 20.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedText(
            "Export fields information",
            size: 20.0,
          ),
          const SizedBox(
            height: 15.0,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color.fromARGB(249, 35, 34, 34)
                  : const Color.fromARGB(255, 249, 245, 255),
              border: Border.all(
                width: 1,
                color: Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromARGB(115, 53, 52, 52)
                    : const Color.fromARGB(255, 249, 245, 255),
              ),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Table(
                    border: TableBorder.symmetric(
                      inside: BorderSide(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color.fromARGB(115, 53, 52, 52)
                            : const Color.fromARGB(201, 233, 216, 255),
                      ),
                    ),
                    children: [
                      buildTableField(
                          "name", "Name associated with the call log entry"),
                      buildTableField("number",
                          "Phone number associated with the call log entry"),
                      buildTableField("phone_account_id",
                          "The ID of the phone account associated with the call identifies the specific account or SIM card used to place or receive the call"),
                      buildTableField("call_type",
                          "Type of the call (e.g., incoming, outgoing, missed)"),
                      buildTableField("formatted_number",
                          "Formatted phone number, formatted with formatting rules based on the country the user was in when the call was made or received."),
                      buildTableField("sim_display_name",
                          "Display name of the SIM card associated with the call"),
                      buildTableField(
                          "timestamp", "Timestamp (epoch time) of the call"),
                      buildTableField(
                          "duration", "Duration of the call in seconds"),
                      buildTableField("cached_number_label",
                          "Label associated with the cached phone number"),
                      buildTableField("cached_number_type",
                          "The cached number type (Home, Work, etc) associated with the phone number, if it exists."),
                      buildTableField("cached_matched_number",
                          "Stored or cached phone number associated with a call log entry for quick reference."),
                    ],
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
