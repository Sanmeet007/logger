import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppLocaleHelpers {
  static List<String> getWeekdays(BuildContext context) {
    final locale = AppLocalizations.of(context).localeName;
    DateTime reference = DateTime(2025, 10, 5);
    return List.generate(7, (index) {
      final day = reference.add(Duration(days: index));
      return DateFormat.E(locale).format(day);
    });
  }
}
