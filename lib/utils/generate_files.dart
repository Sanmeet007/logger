import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:call_log/call_log.dart';
import 'package:logger/utils/file_types.dart';
import 'package:shared_storage/shared_storage.dart';

String _toCsvString(final Iterable<CallLogEntry>? callLogs) {
  // Legends -> Snake case -> Py ?!
  String fileContent =
      "name,duration,number,phone_account_id,call_type,formatted_number,sim_display_name,timestamp,cached_number_label,cached_number_type,cached_matched_number\n";

  if (callLogs != null) {
    fileContent += callLogs
        .map((entry) => [
              entry.name ?? "",
              entry.duration ?? "",
              entry.number ?? "",
              entry.phoneAccountId ?? "",
              entry.callType ?? "",
              entry.formattedNumber ?? "",
              entry.simDisplayName ?? "",
              entry.timestamp ?? "",
              entry.cachedNumberLabel ?? "",
              entry.cachedNumberType ?? "",
              entry.cachedMatchedNumber ?? "",
            ].join(","))
        .join("\n");
  }
  return fileContent;
}

Map<String, dynamic> _jsonifyCallEntry(CallLogEntry entry) {
  return {
    'name': entry.name,
    'duration': entry.duration,
    'number': entry.number,
    'phoneAccountId': entry.phoneAccountId,
    'callType': entry.callType.toString(),
    'formattedNumber': entry.formattedNumber,
    'simDisplayName': entry.simDisplayName,
    'timestamp': entry.timestamp,
    'cachedNumberLabel': entry.cachedNumberLabel,
    'cachedNumberType': entry.cachedNumberType,
    'cachedMatchedNumber': entry.cachedMatchedNumber,
  };
}

String _iCalifyCallEntry(CallLogEntry entry) {
  final start =
      DateTime.fromMillisecondsSinceEpoch(entry.timestamp ?? 0, isUtc: true);
  final end = start.add(Duration(seconds: entry.duration ?? 0));

  String format(DateTime dt) {
    return "${dt.year.toString().padLeft(4, '0')}"
        "${dt.month.toString().padLeft(2, '0')}"
        "${dt.day.toString().padLeft(2, '0')}T"
        "${dt.hour.toString().padLeft(2, '0')}"
        "${dt.minute.toString().padLeft(2, '0')}"
        "${dt.second.toString().padLeft(2, '0')}Z";
  }

  final uid = "${entry.timestamp}-${entry.number}@logger";

  return """
BEGIN:VEVENT
UID:$uid
DTSTAMP:${format(start)}
DTSTART:${format(start)}
DTEND:${format(end)}
SUMMARY:${entry.name ?? entry.formattedNumber}
DESCRIPTION:Number: ${entry.formattedNumber}\\nType: ${entry.callType?.index}
CATEGORIES:${entry.callType?.name}
${entry.simDisplayName != null ? "LOCATION:${entry.simDisplayName}" : ""}
X-DURATION:PT${entry.duration}S
X-PHONE-ACCOUNT-ID:${entry.phoneAccountId ?? ""}
X-NUMBER-LABEL:${entry.cachedNumberLabel ?? ""}
X-NUMBER-TYPE:${entry.cachedNumberType ?? ""}
X-MATCHED-NUMBER:${entry.cachedMatchedNumber ?? ""}
END:VEVENT""";
}

String _toICalString(final Iterable<CallLogEntry>? callLogs) {
  if (callLogs == null) {
    return "BEGIN:VCALENDAR\nVERSION:2.0\nPRODID:-//Logger App//EN\nEND:VCALENDAR";
  }

  final buffer = StringBuffer();

  buffer.writeln("BEGIN:VCALENDAR");
  buffer.writeln("VERSION:2.0");
  buffer.writeln("PRODID:-//Logger App//EN");

  for (final entry in callLogs) {
    buffer.writeln(_iCalifyCallEntry(entry));
  }

  buffer.writeln("END:VCALENDAR");

  return buffer.toString();
}

String _toJsonString(final Iterable<CallLogEntry>? callLogs) {
  // Fields -> camelCase -> Js ?!
  if (callLogs == null) return '[]';

  List<Map<String, dynamic>> jsonList =
      callLogs.map((entry) => _jsonifyCallEntry(entry)).toList();
  return jsonEncode(jsonList);
}

class CallLogsFileGenerator {
  static const FileType defaultImportType = FileType.csv;

  static String getMimeTypeFromImportType(FileType t) {
    switch (t) {
      case FileType.csv:
        return "text/comma-separated-values";
      case FileType.json:
        return "application/json";
      case FileType.ical:
        return "text/calendar";
    }
  }

  static Future<String> toCsvString(
      final Iterable<CallLogEntry> callLogs) async {
    return await Isolate.run(() => _toCsvString(callLogs));
  }

  static Future<String> toICalString(
      final Iterable<CallLogEntry> callLogs) async {
    return await Isolate.run(() => _toICalString(callLogs));
  }

  static Future<String> toJsonString(
      final Iterable<CallLogEntry> callLogs) async {
    return await Isolate.run(() => _toJsonString(callLogs));
  }

  static Future<Uri?> generateLogsFile({
    required Uri parentUri,
    required String filename,
    required FileType fileType,
    Iterable<CallLogEntry>? callLogs,
  }) async {
    String contents = "";
    try {
      if (callLogs == null) return null;
      if (fileType == FileType.csv) {
        contents = await toCsvString(callLogs);
      } else if (fileType == FileType.json) {
        contents = await toJsonString(callLogs);
      } else if (fileType == FileType.ical) {
        contents = await toICalString(callLogs);
      }

      DocumentFile? file = await createFileAsBytes(
        parentUri,
        mimeType: getMimeTypeFromImportType(fileType),
        displayName: filename,
        bytes: utf8.encode(contents),
      );
      if (file != null) {
        return file.uri;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<bool> addLogsToFile({
    required File file,
    required FileType fileType,
    Iterable<CallLogEntry>? callLogs,
  }) async {
    String contents = "";
    try {
      if (callLogs == null) return false;
      if (fileType == FileType.csv) {
        contents = await toCsvString(callLogs);
      } else if (fileType == FileType.json) {
        contents = await toJsonString(callLogs);
      }
      file.writeAsStringSync(contents);
      return true;
    } catch (e) {
      return false;
    }
  }
}
