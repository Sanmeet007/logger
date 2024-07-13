import 'package:intl/intl.dart';

class TimeFormatItem {
  final String value;
  final bool interpret;

  TimeFormatItem(this.value, this.interpret);
}

class ExportedFileFormatHelper {
  static const defaultFormat = "call_logger-%y%m%d-%H%M%S";

  static final Map<String, String> _strfToDateFormat = {
    "Y": "yyyy", // Year with century (e.g., 2024)
    "y": "yy", // Year without century (e.g., 24)
    "m": "MM", // Month as a number (01-12)
    "B": "MMMM", // Full month name (e.g., July)
    "b": "MMM", // Abbreviated month name (e.g., Jul)
    "d": "dd", // Day of the month (01-31)
    "a": "EEE", // Abbreviated weekday name (e.g., Fri)
    "A": "EEEE", // Full weekday name (e.g., Friday)
    "H": "HH", // Hour in 24-hour format (00-23)
    "I": "hh", // Hour in 12-hour format (01-12)
    "M": "mm", // Minutes (00-59)
    "S": "ss", // Seconds (00-59)
    "p": "a", // AM/PM marker (e.g., AM, PM)
    "f": "SSS", // Milliseconds (000-999)
    "z": "z", // Time zone offset from UTC (e.g., +0100)
    "Z": "z", // Time zone name (e.g., UTC)
    "j": "D", // Day of the year (001-366)
    "U":
        "W", // Week number of the year (00-53), Sunday as the first day of the week
    "W":
        "W", // Week number of the year (00-53), Monday as the first day of the week
    "c":
        "EEE, MMM d yyyy HH:mm:ss", // Date and time representation (e.g., Fri, Jul 12 2024 14:15:00)
    "x": "MM/dd/yyyy", // Date representation (e.g., 07/12/2024)
    "X": "HH:mm:ss", // Time representation (e.g., 14:15:00)
  };

  static bool validateExportedFormat(String exportedFormat) {
    return _splitFormatString(exportedFormat) != null;
  }

  static List<TimeFormatItem>? _splitFormatString(String formatString) {
    List<TimeFormatItem> timeFormatItems = [];

    String prevChars = "";
    for (int i = 0; i < formatString.length - 1; i++) {
      String char = formatString[i];

      if (char == "%") {
        if (prevChars != "") {
          timeFormatItems.add(TimeFormatItem(prevChars, false));
        }
        prevChars = "";

        if (i + 1 >= formatString.length) continue;
        String ctrlChar = formatString[i + 1];

        if (ctrlChar == "%") {
          // %% -> %
          timeFormatItems.add(TimeFormatItem("%", false));
        } else {
          if (_strfToDateFormat.containsKey(ctrlChar)) {
            timeFormatItems
                .add(TimeFormatItem(_strfToDateFormat[ctrlChar]!, true));
          } else {
            // invalid strftime char found
            return null;
          }
        }
        i++;
      } else {
        prevChars += char;
      }
    }
    if (prevChars != "") timeFormatItems.add(TimeFormatItem(prevChars, false));

    return timeFormatItems;
  }

  static String createFileFormat(String exportFormat) {
    List<TimeFormatItem>? timeFormatItems = _splitFormatString(exportFormat);
    if (timeFormatItems == null) return createFileFormat(defaultFormat);

    DateTime now = DateTime.now();

    String fileFormat = "";
    for (TimeFormatItem timeFormatItem in timeFormatItems) {
      if (timeFormatItem.interpret) {
        fileFormat += DateFormat(timeFormatItem.value).format(now);
      } else {
        fileFormat += timeFormatItem.value;
      }
    }

    return fileFormat;
  }
}
