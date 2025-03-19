import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:logger/components/common/date_picker.dart';
import 'package:logger/components/common/sized_text.dart';
import 'package:logger/components/common/toggle_button.dart';
import 'package:logger/providers/loader_provider.dart';
import 'package:logger/providers/log_filters_provider.dart';
import 'package:logger/utils/filter_date_ranges.dart';
import 'package:logger/utils/filters.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogFilters extends ConsumerStatefulWidget {
  final WidgetRef parentRef;
  final Map currentFilters;
  final bool canFilterUsingDuration;
  final bool canFilterUsingPhoneAccountId;
  final List<String> availablePhoneAccountIds;

  const LogFilters({
    super.key,
    required this.currentFilters,
    required this.availablePhoneAccountIds,
    required this.canFilterUsingDuration,
    required this.canFilterUsingPhoneAccountId,
    required this.parentRef,
  });

  @override
  ConsumerState<LogFilters> createState() => _LogFiltersState();
}

class _LogFiltersState extends ConsumerState<LogFilters> {
  final formatter = DateFormat("yyyy-MM-dd");

  // Creating new mutable List
  List<CallType> callTypes = [...CallType.values];

  late bool isNumberSearchEnabled;
  late bool isDurationFilteringOn;
  late DateRange dateRangeOption;
  late List<CallType> selectedCallTypes;
  late String selectedPhoneAccountId;
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
    selectedPhoneAccountId = widget.currentFilters["phone_acc_id"];
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

  void handleDateRangeOptionChange(DateRange? v) {
    setState(() {
      dateRangeOption = v ?? DateRange.allTime;
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

  void applyFilters() async {
    final ref = widget.parentRef;
    Navigator.pop(context, true);

    if (shouldApplyFilters()) {
      ref.read(loaderProvider.notifier).showLoading();

      await ref.read(logsFilterProvider.notifier).applyFilters({
        "specific_ph": isNumberSearchEnabled,
        "phone_to_match": _phoneNumberInputController.text,
        "selected_call_types": selectedCallTypes,
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
        "phone_acc_id": selectedPhoneAccountId,
      });

      ref.read(loaderProvider.notifier).hideLoading();
    }
  }

  void clearFilters() {
    Navigator.pop(context, true);
    ref.read(logsFilterProvider.notifier).resetFilters();
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
      "phone_acc_id": selectedPhoneAccountId,
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

  void handlePhoneAccountIdValueChange(String? v) {
    if (v == null) return;
    setState(() {
      selectedPhoneAccountId = v;
    });
    checkFiltersState();
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
                            AppLocalizations.of(context).searchByNumberText,
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
                            keyboardType:
                                const TextInputType.numberWithOptions(),
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
                                            ? AppLocalizations.of(context)
                                                .anyText
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
                                          color:
                                              Color.fromARGB(255, 66, 66, 66),
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
                                          color:
                                              Color.fromARGB(255, 66, 66, 66),
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
                                onChanged: handleDateRangeOptionChange),
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
                        onPressed: clearFilters,
                        child: Text(
                          AppLocalizations.of(context).resetToDefaultText,
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
                        onPressed: canApplyFilters ? applyFilters : null,
                        child: Text(
                          AppLocalizations.of(context).applyFiltersText,
                        ),
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
