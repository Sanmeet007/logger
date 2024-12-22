import 'package:flutter/material.dart';
import 'package:logger/components/sized_text.dart';
import 'package:logger/screens/ExportInfo/field_builder.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

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
          SizedText(
            AppLocalizations.of(context)!.exportFieldInfoText,
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
                        "name",
                        AppLocalizations.of(context)!.csvJsonExportNameField,
                      ),
                      buildTableField(
                        "number",
                        AppLocalizations.of(context)!.csvJsonExportNumberField,
                      ),
                      buildTableField(
                        "phone_account_id",
                        AppLocalizations.of(context)!
                            .csvJsonExportPhoneAccountIdField,
                      ),
                      buildTableField(
                        "call_type",
                        AppLocalizations.of(context)!
                            .csvJsonExportCallTypeField,
                      ),
                      buildTableField(
                        "formatted_number",
                        AppLocalizations.of(context)!
                            .csvJsonExportFormattedNumberField,
                      ),
                      buildTableField(
                        "sim_display_name",
                        AppLocalizations.of(context)!
                            .csvJsonExportSimDisplayField,
                      ),
                      buildTableField(
                        "timestamp",
                        AppLocalizations.of(context)!
                            .csvJsonExportTimestampField,
                      ),
                      buildTableField(
                        "duration",
                        AppLocalizations.of(context)!
                            .csvJsonExportDurationField,
                      ),
                      buildTableField(
                        "cached_number_label",
                        AppLocalizations.of(context)!
                            .csvJsonExportCachedNumberLabelField,
                      ),
                      buildTableField(
                        "cached_number_type",
                        AppLocalizations.of(context)!
                            .csvJsonExportCachedNumberTypeField,
                      ),
                      buildTableField(
                        "cached_matched_number",
                        AppLocalizations.of(context)!
                            .csvJsonExportCachedMatchedNumberField,
                      ),
                    ],
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
