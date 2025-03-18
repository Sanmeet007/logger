import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/components/common/divider.dart';
import 'package:logger/components/common/lined_text.dart';
import 'package:logger/providers/shared_preferences_providers/call_log_count_provider.dart';
import 'package:logger/providers/shared_preferences_providers/download_confirmation_provider.dart';
import 'package:logger/providers/shared_preferences_providers/duration_filtering_provider.dart';
import 'package:logger/providers/shared_preferences_providers/export_file_name_format_provider.dart';
import 'package:logger/providers/shared_preferences_providers/export_type_provider.dart';
import 'package:logger/providers/shared_preferences_providers/logs_sharing_provider.dart';
import 'package:logger/providers/shared_preferences_providers/phone_account_filtering_provider.dart';
import 'package:logger/providers/shared_preferences_providers/total_call_duration_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/screens/settings/fragments/export_filename_dialog.dart';
import 'package:logger/screens/settings/fragments/export_format_dialog.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> advancedSettingsListItems = <Widget>[
      ListTile(
        onTap: () {
          showModalBottomSheet(
            showDragHandle: true,
            isScrollControlled: true,
            context: context,
            builder: (_) {
              return Wrap(
                children: [
                  ExportFilenameDialog(
                    exportFileNameFormat:
                        ref.read(exportFileNameFormatProvider),
                  ),
                ],
              );
            },
          );
        },
        title: Text(AppLocalizations.of(context).exportFileNameFormatLabelText),
        trailing: Icon(Icons.keyboard_arrow_right_rounded),
      ),
      ListTile(
        onTap: () {
          showModalBottomSheet(
            showDragHandle: true,
            isScrollControlled: true,
            context: context,
            builder: (_) {
              return Wrap(
                children: [
                  ExportFormatDialog(
                    fileType: ref.read(exportTypeProvider),
                  ),
                ],
              );
            },
          );
        },
        title: Text(AppLocalizations.of(context).callLogsExportFormatLabelText),
        trailing: Icon(Icons.keyboard_arrow_right_rounded),
      ),
      ListTile(
        onTap: () {},
        title: Text(AppLocalizations.of(context).importCallLogsText),
        trailing: Icon(Icons.keyboard_arrow_right_rounded),
      ),
    ];

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context).baseSettingsLabelText,
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(249, 34, 34, 34)
                      : const Color.fromARGB(255, 249, 245, 255),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LinedText(
                          text: AppLocalizations.of(context)
                              .disableLogsSharingText,
                        ),
                        Switch(
                          value: ref.watch(logsSharingProvider),
                          onChanged: (_) =>
                              ref.read(logsSharingProvider.notifier).toggle(),
                        ),
                      ],
                    ),
                    const LogDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LinedText(
                          text: AppLocalizations.of(context)
                              .enableDownloadConfirmationText,
                        ),
                        Switch(
                          value: ref.watch(downloadConfirmationProvider),
                          onChanged: (bool newState) => ref
                              .read(downloadConfirmationProvider.notifier)
                              .toggle(),
                        ),
                      ],
                    ),
                    const LogDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LinedText(
                          text: AppLocalizations.of(context)
                              .enableCallLogCountVisibilityText,
                        ),
                        Switch(
                          value: ref.watch(callLogCountProvider),
                          onChanged: (_) =>
                              ref.read(callLogCountProvider.notifier).toggle(),
                        ),
                      ],
                    ),
                    const LogDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LinedText(
                          text: AppLocalizations.of(context)
                              .enableCallDurationFilteringText,
                        ),
                        Switch(
                          value: ref.watch(durationFilteringProvider),
                          onChanged: (_) => ref
                              .read(durationFilteringProvider.notifier)
                              .toggle(),
                        ),
                      ],
                    ),
                    const LogDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LinedText(
                          text: AppLocalizations.of(context)
                              .enableFilterByAccountIdText,
                        ),
                        Switch(
                          value: ref.watch(phoneAccountFilteringProvider),
                          onChanged: (_) => ref
                              .read(phoneAccountFilteringProvider.notifier)
                              .toggle(),
                        ),
                      ],
                    ),
                    const LogDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LinedText(
                          text: AppLocalizations.of(context)
                              .showTotalCallDurationText,
                        ),
                        Switch(
                          value: ref.watch(totalCallDurationProvider),
                          onChanged: (_) => ref
                              .read(totalCallDurationProvider.notifier)
                              .toggle(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                AppLocalizations.of(context).advancedSettingsLabelText,
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 15.0),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(249, 34, 34, 34)
                      : const Color.fromARGB(255, 249, 245, 255),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Material(
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: advancedSettingsListItems.length,
                    itemBuilder: (context, index) {
                      return advancedSettingsListItems[index];
                    },
                    separatorBuilder: (context, index) {
                      return const LogDivider();
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
