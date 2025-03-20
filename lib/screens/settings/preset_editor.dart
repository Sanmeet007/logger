// TextFields look alike in all ui comp

import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:logger/components/common/date_picker.dart';
import 'package:logger/components/common/sized_text.dart';
import 'package:logger/components/common/toggle_button.dart';
import 'package:logger/data/models/filter_preset.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/providers/filter_presets_provider.dart';
import 'package:logger/utils/filter_date_ranges.dart';
import 'package:logger/utils/filters.dart';

class PresetEditor extends ConsumerStatefulWidget {
  final FilterPreset preset;
  final List<String> availablePhoneAccountIds;
  final bool canFilterUsingPhoneAccountId;
  final bool canFilterUsingDuration;

  const PresetEditor({
    super.key,
    required this.preset,
    required this.availablePhoneAccountIds,
    required this.canFilterUsingPhoneAccountId,
    required this.canFilterUsingDuration,
  });

  @override
  ConsumerState<PresetEditor> createState() => _PresetEditorState();
}

class _PresetEditorState extends ConsumerState<PresetEditor> {
  final formatter = DateFormat("yyyy-MM-dd");
  bool canApplyFilters = true;

  late bool isNumberSearchEnabled;
  late bool isDurationFilteringOn;
  late String selectedPhoneAccountId;
  late DateRange dateRangeOption;

  late final TextEditingController _presetInputNameContoller;
  late final TextEditingController _phoneNumberInputController;
  late final TextEditingController _minDurationInputController;
  late final TextEditingController _maxDurationInputController;
  late final TextEditingController _startDateController, _endDateController;
  late final List<CallType> selectedCallTypes;

  void toggleNumberSearch(bool v) {
    setState(() {
      isNumberSearchEnabled = v;
    });
  }

  void handlePhoneNumberValueChange(String v) {}
  void handlePhoneAccountIdValueChange(String? v) {}
  void setFilterByDurationState(bool v) {
    setState(() {
      isDurationFilteringOn = v;
    });
  }

  void handleMinDurationValueChange(String? v) {}
  void handleMaxDurationValueChange(String? v) {}
  void handleCallTypeChange(CallType t, bool v) {}
  void handleDateRangeOptionChange(DateRange? op) {
    if (op == null) return;
    setState(() {
      dateRangeOption = op;
    });
  }

  void handleStartDateChanges(String v) {}
  void handleEndDateChanges(String v) {}

  void saveFilterPreset() async {
    print("ADDING PRESET !");
    await ref.read(filterPresetsProvider.notifier).addFilterPreset(
          Filter(
            usesSpecificPhoneNumber: isNumberSearchEnabled,
            phoneToMatch: _phoneNumberInputController.text,
            selectedCallTypes: selectedCallTypes,
            dateRangeOption: dateRangeOption,
            startDate: _startDateController.text.isEmpty
                ? DateTime.now()
                : DateTime.parse(_startDateController.text),
            endDate: _endDateController.text.isEmpty
                ? DateTime.now()
                : DateTime.parse(_endDateController.text),
            usesDurationFiltering: isDurationFilteringOn,
            minDuration: Duration(
              seconds: int.tryParse(_minDurationInputController.text) ?? 0,
            ),
            maxDuration: _maxDurationInputController.text.isEmpty
                ? null
                : Duration(
                    seconds:
                        int.tryParse(_maxDurationInputController.text) ?? 0,
                  ),
            phoneAccountId: selectedPhoneAccountId,
          ),
          _presetInputNameContoller.text,
        );
    print("ADDED PRESET");
    if (mounted) {
      Navigator.pop(context);
    }
  }

  void clearFilters() {}

  @override
  void initState() {
    super.initState();
    _phoneNumberInputController = TextEditingController();
    _presetInputNameContoller = TextEditingController()..text = "SpeedyPick#1";
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
    _minDurationInputController = TextEditingController();
    _maxDurationInputController = TextEditingController();

    selectedPhoneAccountId = widget.preset.filterDetails.phoneAccountId;
    dateRangeOption = widget.preset.filterDetails.dateRangeOption;
    selectedCallTypes = widget.preset.filterDetails.selectedCallTypes;

    isNumberSearchEnabled = widget.preset.filterDetails.usesSpecificPhoneNumber;
    isDurationFilteringOn = widget.preset.filterDetails.usesDurationFiltering;
  }

  @override
  void dispose() {
    _phoneNumberInputController.dispose();
    _presetInputNameContoller.dispose();
    _startDateController.dispose();
    _endDateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: TextField(
                  controller: _presetInputNameContoller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 66, 66, 66),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 66, 66, 66),
                      ),
                    ),
                    label: Text("Preset Name"),
                    hintText: "Enter a name for preset",
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Material(
                      child: SwitchListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5.0),
                        title: SizedText(
                          AppLocalizations.of(context).searchByNumberText,
                          size: 18.0,
                        ),
                        value: isNumberSearchEnabled,
                        onChanged: toggleNumberSearch,
                      ),
                    ),
                    if (isNumberSearchEnabled)
                      Container(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 15.0, right: 15.0, left: 15.0),
                        child: TextField(
                          onChanged: handlePhoneNumberValueChange,
                          controller: _phoneNumberInputController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 66, 66, 66),
                              ),
                            ),
                            label: Text(
                              AppLocalizations.of(context).mobileNumberText,
                            ),
                            hintText: AppLocalizations.of(context)
                                .hintMobileNumberText,
                          ),
                          keyboardType: const TextInputType.numberWithOptions(),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              if (widget.canFilterUsingPhoneAccountId)
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedText(
                            AppLocalizations.of(context)
                                .phoneAccountIdFilterText,
                            size: 18.0,
                          ),
                          Container(
                            width: 100.0,
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
                              // isDense: true,
                              underline: Container(),
                              isExpanded: true,
                              isDense: true,
                              enableFeedback: true,
                              value: selectedPhoneAccountId,
                              items: [
                                ...widget.availablePhoneAccountIds.map(
                                  (item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item == "Any"
                                          ? AppLocalizations.of(context).anyText
                                          : item,
                                    ),
                                  ),
                                )
                              ],
                              onChanged: handlePhoneAccountIdValueChange,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              if (widget.canFilterUsingPhoneAccountId)
                const SizedBox(height: 10.0),
              if (widget.canFilterUsingDuration)
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 15.0,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedText(
                            AppLocalizations.of(context).filterByDurationText,
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
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 66, 66, 66),
                                      ),
                                    ),
                                    label: Text(
                                      AppLocalizations.of(context)
                                          .minimumDurationLabelText,
                                    ),
                                    hintText: AppLocalizations.of(context)
                                        .minimumDurationHintText,
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
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 66, 66, 66),
                                      ),
                                    ),
                                    label: Text(
                                      AppLocalizations.of(context)
                                          .maximumDurationLabelText,
                                    ),
                                    hintText: AppLocalizations.of(context)
                                        .maximumDurationHintText,
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
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedText(
                      AppLocalizations.of(context).filterByCallTypeText,
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
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedText(
                          AppLocalizations.of(context).dateRangeText,
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
                          child: DropdownButton<DateRange>(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 10.0,
                            ),
                            isDense: true,
                            underline: Container(),
                            enableFeedback: true,
                            value: dateRangeOption,
                            items: [
                              ...DateRangeHelper.getRanges(context).map(
                                (item) => DropdownMenuItem(
                                  value: item["key"],
                                  child: Text(
                                    item["value"]!,
                                  ),
                                ),
                              )
                            ],
                            onChanged: handleDateRangeOptionChange,
                          ),
                        ),
                      ],
                    ),
                    if (dateRangeOption == DateRange.custom)
                      Column(
                        children: [
                          const SizedBox(
                            height: 15.0,
                          ),
                          LoggerDatePicker(
                            languageCode:
                                Localizations.localeOf(context).languageCode,
                            controller: _startDateController,
                            onChanged: handleStartDateChanges,
                            fieldTitle:
                                AppLocalizations.of(context).startDateText,
                            firstDate: DateTime(1995),
                            lastDate:
                                DateTime.now().add(const Duration(days: 0)),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          LoggerDatePicker(
                            languageCode:
                                Localizations.localeOf(context).languageCode,
                            controller: _endDateController,
                            onChanged: handleEndDateChanges,
                            fieldTitle:
                                AppLocalizations.of(context).endDateText,
                            firstDate: DateTime(1995),
                            lastDate: DateTime.now(),
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
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                      ),
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
                      onPressed: canApplyFilters ? saveFilterPreset : null,
                      child: Text(
                        "Save",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
