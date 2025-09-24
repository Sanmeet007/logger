import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:duration/duration.dart' as duration_util;
import 'package:duration/locale.dart' as duration_locale;

class FromatHelpers {
  static String prettifyDate(DateTime inputDate, BuildContext context) {
    DateTime now = DateTime.now();
    DateTime today = DateTime.now();
    DateTime yesterday = DateTime(now.year, now.month, now.day - 1);

    if (DateUtils.isSameDay(inputDate, today)) {
      return AppLocalizations.of(context).todayText;
    } else if (DateUtils.isSameDay(inputDate, yesterday)) {
      return AppLocalizations.of(context).yesterdayText;
    } else {
      return DateFormat(
        'dd MMMM yyyy',
        Localizations.localeOf(context).languageCode,
      ).format(inputDate);
    }
  }

  static String prettifyNumbers(int n, BuildContext context) {
    final formatter = NumberFormat.compact(
      locale: Localizations.localeOf(context).languageCode,
    );
    return formatter.format(n);
  }

  static String capitalizeString(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1);
  }

  static String prettifyDuration(
    Duration duration,
    BuildContext context, {
    var tersity = duration_util.DurationTersity.second,
    var upperTersity = duration_util.DurationTersity.week,
  }) {
    final locale = Localizations.localeOf(context).languageCode;
    duration_locale.DurationLocale? durationLocale =
        duration_locale.DurationLocale.fromLanguageCode(locale);

    return duration_util.prettyDuration(
      duration,
      abbreviated: true,
      locale: durationLocale ?? duration_locale.englishLocale,
      delimiter: ' ',
      tersity: tersity,
      upperTersity: upperTersity,
    );
  }

  static String formatTimeFromTimeStamp({
    required int timestamp,
    required BuildContext context,
  }) {
    final bool use24HrsFormat = MediaQuery.of(context).alwaysUse24HourFormat;

    String format = use24HrsFormat ? 'HH:mm' : 'hh:mm a';

    final timeFormatter =
        DateFormat(format, Localizations.localeOf(context).languageCode);
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return timeFormatter.format(date);
  }

  static String formatDateFromTimestamp(int timestamp, BuildContext context) {
    final formatter = DateFormat(
        "dd MMMM yyyy", Localizations.localeOf(context).languageCode);
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return formatter.format(date);
  }
}
