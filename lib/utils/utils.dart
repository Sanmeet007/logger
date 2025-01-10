import 'package:call_log/call_log.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:duration/duration.dart' as duration_util;
import 'package:duration/locale.dart' as duration_locale;

String getVersion() {
  return "2.8.3";
}

String getDeviceType(BuildContext context) {
  var width = MediaQuery.of(context).size.width;
  return (width < 500) ? 'phone' : 'tablet';
}

bool isTabView(BuildContext context) {
  return getDeviceType(context) == "tablet";
}

bool isLargestView(BuildContext context) {
  var width = MediaQuery.of(context).size.width;
  return (width > 1000);
}

String supportURL() {
  return "https://github.com/Sanmeet007/logger";
}

String supportEmail() {
  return "ssanmeet123@gmail.com";
}

String prettifyDate(DateTime inputDate, BuildContext context) {
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

Map<String, List<CallLogEntry>> groupCallLogsByDate(
    Iterable<CallLogEntry> callLogs, BuildContext context) {
  final Map<String, List<CallLogEntry>> groupedCallLogs = {};

  for (var entry in callLogs) {
    final String dateKey = prettifyDate(
        DateTime.fromMillisecondsSinceEpoch(entry.timestamp ?? 1), context);
    groupedCallLogs.putIfAbsent(dateKey, () => []).add(entry);
  }

  return groupedCallLogs;
}

Uri getReportLink() {
  Uri reportLink = Uri.parse('https://github.com/Sanmeet007/logger/issues');
  return reportLink;
}

Uri getRepoLink() {
  Uri reportLink = Uri.parse('https://github.com/Sanmeet007/logger');
  return reportLink;
}

Uri getDonationLink() {
  Uri donationLink = Uri.parse('https://buymeacoffee.com/sanmeet007');
  return donationLink;
}

String prettifyNumbers(int n, BuildContext context) {
  final formatter = NumberFormat.compact(
    locale: Localizations.localeOf(context).languageCode,
  );
  return formatter.format(n);
}

String prettifyDuration(
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

String parsePhoneNumber(String phnum) {
  if (phnum.isEmpty) {
    return phnum;
  }
  if (phnum.startsWith("+")) {
    var parseNumber = PhoneNumber.parse(phnum);
    return phnum.replaceAll("+${parseNumber.countryCode}", "");
  } else {
    return phnum;
  }
}

List getCallDisplayFields(CallType callType, BuildContext context) {
  String rCallType;
  late Color callColor;
  late IconData callIcon;

  if (callType == CallType.missed) {
    rCallType = AppLocalizations.of(context).missedText;
    callColor = Colors.redAccent;
    callIcon = Icons.call_missed;
  } else if (callType == CallType.incoming) {
    rCallType = AppLocalizations.of(context).incomingText;
    callColor = Colors.blue;
    callIcon = Icons.call_received;
  } else if (callType == CallType.outgoing) {
    rCallType = AppLocalizations.of(context).outgoingText;
    callColor = const Color.fromARGB(255, 175, 121, 255);
    callIcon = Icons.call_made;
  } else if (callType == CallType.blocked) {
    rCallType = AppLocalizations.of(context).blockedText;
    callColor = Colors.orange;
    callIcon = Icons.block;
  } else if (callType == CallType.rejected) {
    rCallType = AppLocalizations.of(context).rejectedText;
    callColor = Colors.red;
    callIcon = Icons.cancel_outlined;
  } else if (callType == CallType.wifiIncoming) {
    rCallType = AppLocalizations.of(context).wifiIncomingText;
    callColor = const Color.fromARGB(255, 110, 113, 255);
    callIcon = Icons.call_received;
  } else if (callType == CallType.wifiOutgoing) {
    rCallType = AppLocalizations.of(context).wifiOutgoingText;
    callColor = const Color.fromARGB(255, 110, 110, 255);
    callIcon = Icons.call_made;
  } else {
    rCallType = callType.toString().replaceAll("CallType.", "");
    rCallType =
        "${rCallType[0].toUpperCase()}${rCallType.substring(1).toLowerCase()}";
    callColor = Colors.grey;
    callIcon = Icons.call;
  }
  return [callColor, callIcon, rCallType];
}

String formatTimeFromTimeStamp({
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

String formatDateFromTimestamp(int timestamp, BuildContext context) {
  final formatter =
      DateFormat("dd MMMM yyyy", Localizations.localeOf(context).languageCode);
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  return formatter.format(date);
}

String shrinkPhoneAccountID(String input) {
  if (input.length > 10) {
    return '${input.substring(0, 3)}...${input.substring(input.length - 3)}';
  } else {
    return input;
  }
}
