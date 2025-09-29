import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum DateRange {
  today,
  yesterday,
  thisMonth,
  pastMonth,
  thisYear,
  pastYear,
  allTime,
  custom,
  // cycle,
}

class DateRangeHelper {
  static List<Map<String, dynamic>> getRanges(BuildContext context) {
    return [
      {
        "value": AppLocalizations.of(context).todayText,
        "key": DateRange.today,
      },
      {
        "value": AppLocalizations.of(context).yesterdayText,
        "key": DateRange.yesterday,
      },
      {
        "value": AppLocalizations.of(context).thisMonthText,
        "key": DateRange.thisMonth,
      },
      {
        "value": AppLocalizations.of(context).pastMonthText,
        "key": DateRange.pastMonth,
      },
      {
        "value": AppLocalizations.of(context).thisYearText,
        "key": DateRange.thisYear,
      },
      {
        "value": AppLocalizations.of(context).pastYearText,
        "key": DateRange.pastYear,
      },
      {
        "value": AppLocalizations.of(context).allTimeText,
        "key": DateRange.allTime,
      },
      {
        "value": AppLocalizations.of(context).customText,
        "key": DateRange.custom,
      },
      // {
      //   "value": "Cycle",
      //   "key": DateRange.cycle,
      // }
    ];
  }
}
