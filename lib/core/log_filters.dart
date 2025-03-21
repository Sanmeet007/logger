import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/components/common/date_picker.dart';
import 'package:logger/components/common/sized_text.dart';
import 'package:logger/components/common/toggle_button.dart';
import 'package:logger/data/models/filter_preset.dart';
import 'package:logger/providers/loader_provider.dart';
import 'package:logger/providers/log_filters_provider.dart';
import 'package:logger/utils/call_display_helper.dart';
import 'package:logger/utils/filter_date_ranges.dart';
import 'package:logger/utils/filters.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logger/utils/constants.dart' as constants;

class LogFilters extends ConsumerStatefulWidget {
  final WidgetRef parentRef;
  final Filter currentFilter;
  final bool canFilterUsingDuration;
  final bool canFilterUsingPhoneAccountId;
  final List<String> availablePhoneAccountIds;
  final List<FilterPreset> availablePresets;
  final bool canUsePresets;
  final int initialPresetId;

  const LogFilters({
    super.key,
    required this.currentFilter,
    required this.availablePhoneAccountIds,
    required this.canFilterUsingDuration,
    required this.canFilterUsingPhoneAccountId,
    required this.availablePresets,
    required this.canUsePresets,
    required this.parentRef,
    this.initialPresetId = -1,
  });

  @override
  ConsumerState<LogFilters> createState() => _LogFiltersState();
}

class _LogFiltersState extends ConsumerState<LogFilters> {
  final formatter = CallDisplayHelper.defaultDateFormatter;

  // Mutable List
  List<CallType> callTypes = [...CallType.values];

  late int currentPresetId;
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

    currentPresetId = widget.initialPresetId;

    _phoneNumberInputController =
        TextEditingController(text: widget.currentFilter.phoneToMatch);

    _minDurationInputController = TextEditingController(
      text: widget.currentFilter.minDuration.inSeconds.toString(),
    );
    _maxDurationInputController = TextEditingController(
      text: widget.currentFilter.maxDuration?.inSeconds.toString() ?? "",
    );
    _endDateController = TextEditingController(
      text: formatter.format(
        widget.currentFilter.endDate,
      ),
    );
    _startDateController = TextEditingController(
      text: formatter.format(
        widget.currentFilter.startDate,
      ),
    );

    isNumberSearchEnabled = widget.currentFilter.usesSpecificPhoneNumber;
    dateRangeOption = widget.currentFilter.dateRangeOption;
    selectedCallTypes = widget.currentFilter.selectedCallTypes;
    isDurationFilteringOn = widget.currentFilter.usesDurationFiltering;
    selectedPhoneAccountId = widget.currentFilter.phoneAccountId;
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
      if (currentPresetId != widget.initialPresetId && currentPresetId != -1) {
        await ref
            .read(logsFilterProvider.notifier)
            .changeActiveFilterById(currentPresetId);
      } else {
        await ref.read(logsFilterProvider.notifier).applyFilters(
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
                minDuration: Duration(
                  seconds: int.tryParse(_minDurationInputController.text) ?? 0,
                ),
                maxDuration: _maxDurationInputController.text.isEmpty
                    ? null
                    : Duration(
                        seconds:
                            int.tryParse(_maxDurationInputController.text) ?? 0,
                      ),
                usesDurationFiltering: isDurationFilteringOn,
                phoneAccountId: selectedPhoneAccountId,
              ),
              currentPresetId,
            );
      }
      ref.read(loaderProvider.notifier).hideLoading();
    }
  }

  void clearFilters() {
    Navigator.pop(context, true);
    ref.read(logsFilterProvider.notifier).resetFilters();
  }

  bool shouldApplyFilters() {
    if (currentPresetId != widget.initialPresetId) {
      return true;
    }

    return !FilterUtils.compareFilterMasks(
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
                seconds: int.tryParse(_maxDurationInputController.text) ?? 0,
              ),
        phoneAccountId: selectedPhoneAccountId,
      ),
      widget.currentFilter,
    );
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
    if (widget.currentFilter.phoneToMatch != v) {
      checkFiltersState();
    }
  }

  void handleMinDurationValueChange(String? v) {
    if (v == null) return;
    var k = int.tryParse(v);
    if (k != null && k > 0) {
      if (widget.currentFilter.minDuration.inSeconds !=
          (int.tryParse(v) ?? 0)) {
        checkFiltersState();
      }
    }
  }

  void handleMaxDurationValueChange(String? v) {
    if (v == null) return;
    var k = int.tryParse(v);
    if (k != null && k > 0) {
      if ((widget.currentFilter.maxDuration?.inSeconds ?? 0) !=
          (int.tryParse(v) ?? 0)) {
        checkFiltersState();
      }
    }
  }

  void handleStartDateChanges(String? v) {
    if (v == null) return;
    if (formatter.format(widget.currentFilter.startDate) != v) {
      checkFiltersState();
    }
  }

  void handleEndDateChanges(String? v) {
    if (v == null) return;
    if (formatter.format(widget.currentFilter.endDate) != v) {
      checkFiltersState();
    }
  }

  void handlePresetChange(int? v) {
    if (v == null) return;

    final items = widget.availablePresets.where((e) => e.id == v);
    if (items.isEmpty) return;

    if (items.first.id == -1) {
      setState(() {
        currentPresetId = items.first.id;
        _phoneNumberInputController = TextEditingController(
          text: Filter.defaultFilterConfig.phoneToMatch,
        );

        _minDurationInputController = TextEditingController(
          text: Filter.defaultFilterConfig.minDuration.inSeconds.toString(),
        );
        _maxDurationInputController = TextEditingController();
        _endDateController = TextEditingController();
        _startDateController = TextEditingController();
        isNumberSearchEnabled =
            Filter.defaultFilterConfig.usesSpecificPhoneNumber;
        dateRangeOption = Filter.defaultFilterConfig.dateRangeOption;
        selectedCallTypes = Filter.defaultFilterConfig.selectedCallTypes;
        isDurationFilteringOn =
            Filter.defaultFilterConfig.usesDurationFiltering;
        selectedPhoneAccountId = Filter.defaultFilterConfig.phoneAccountId;
      });
    } else {
      setState(() {
        currentPresetId = items.first.id;
      });
    }
    checkFiltersState();
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
                if (widget.canUsePresets)
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color.fromARGB(255, 65, 65, 65)
                            : Colors.black87,
                      ),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: DropdownButton<int>(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 15.0,
                      ),
                      // isDense: true,
                      underline: Container(),
                      isExpanded: true,
                      isDense: true,
                      enableFeedback: true,
                      value: currentPresetId,
                      items: [
                        ...widget.availablePresets.map(
                          (item) => DropdownMenuItem(
                            value: item.id,
                            child: Text(
                              item.name,
                            ),
                          ),
                        )
                      ],
                      onChanged: handlePresetChange,
                    ),
                  ),
                if (widget.canUsePresets && currentPresetId == -1)
                  SizedBox(
                    height: 10.0,
                  ),
                if (currentPresetId == -1)
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
                                top: 10.0,
                                bottom: 15.0,
                                right: 15.0,
                                left: 15.0),
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
                if (widget.canFilterUsingPhoneAccountId &&
                    currentPresetId == -1)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 15.0,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      trailing: Container(
                        width: 100.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.0,
                            color:
                                Theme.of(context).brightness == Brightness.dark
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
                                  item == constants.defaultPhoneAccountId
                                      ? AppLocalizations.of(context).anyText
                                      : item,
                                ),
                              ),
                            )
                          ],
                          onChanged: handlePhoneAccountIdValueChange,
                        ),
                      ),
                      title: SizedText(
                        AppLocalizations.of(context).phoneAccountIdFilterText,
                        size: 18.0,
                      ),
                    ),
                  ),
                if (widget.canFilterUsingPhoneAccountId &&
                    currentPresetId == -1)
                  const SizedBox(height: 10.0),
                if (widget.canFilterUsingDuration && currentPresetId == -1)
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
                              AppLocalizations.of(context).filterByDurationText,
                              size: 18.0,
                            ),
                            value: isDurationFilteringOn,
                            onChanged: setFilterByDurationState,
                          ),
                        ),
                        if (isDurationFilteringOn)
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 15.0,
                                right: 15.0,
                                left: 15.0),
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
                if (widget.canFilterUsingDuration && currentPresetId == -1)
                  const SizedBox(height: 10.0),
                if (currentPresetId == -1)
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
                if (currentPresetId == -1) const SizedBox(height: 10.0),
                if (currentPresetId == -1)
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
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          leading: SizedText(
                            AppLocalizations.of(context).dateRangeText,
                            size: 18.0,
                          ),
                          trailing: Container(
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
                        ),
                        if (dateRangeOption == DateRange.custom)
                          Column(
                            children: [
                              const SizedBox(
                                height: 15.0,
                              ),
                              LoggerDatePicker(
                                languageCode: Localizations.localeOf(context)
                                    .languageCode,
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
                                languageCode: Localizations.localeOf(context)
                                    .languageCode,
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
                if (currentPresetId == -1)
                  SizedBox(
                    height: 10.0,
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
