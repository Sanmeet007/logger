import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:call_log/call_log.dart';
import 'package:shared_storage/shared_storage.dart';

enum ImportFileType { csv, json }

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

String _toJsonString(final Iterable<CallLogEntry>? callLogs) {
  // Fields -> camelCase -> Js ?!
  if (callLogs == null) return '[]';

  List<Map<String, dynamic>> jsonList =
      callLogs.map((entry) => _jsonifyCallEntry(entry)).toList();
  return jsonEncode(jsonList);
}

class CallLogsFileGenerator {
  static const ImportFileType defaultImportType = ImportFileType.csv;

  static String getMimeTypeFromImportType(ImportFileType t) {
    switch (t) {
      case ImportFileType.csv:
        return "text/comma-separated-values";
      case ImportFileType.json:
        return "application/json";
      default:
        throw ArgumentError("Unknown ImportFileType: $t");
    }
  }

  static Future<String> toCsvString(
      final Iterable<CallLogEntry> callLogs) async {
    return await Isolate.run(() => _toCsvString(callLogs));
  }

  static Future<String> toJsonString(
      final Iterable<CallLogEntry> callLogs) async {
    return await Isolate.run(() => _toJsonString(callLogs));
  }

  static Future<Uri?> generateLogsFile({
    required Uri parentUri,
    required String filename,
    required ImportFileType fileType,
    Iterable<CallLogEntry>? callLogs,
  }) async {
    String contents = "";
    try {
      if (callLogs == null) return null;
      if (fileType == ImportFileType.csv) {
        contents = await toCsvString(callLogs);
      } else if (fileType == ImportFileType.json) {
        contents = await toJsonString(callLogs);
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
    required ImportFileType fileType,
    Iterable<CallLogEntry>? callLogs,
  }) async {
    String contents = "";
    try {
      if (callLogs == null) return false;
      if (fileType == ImportFileType.csv) {
        contents = await toCsvString(callLogs);
      } else if (fileType == ImportFileType.json) {
        contents = await toJsonString(callLogs);
      }
      file.writeAsStringSync(contents);
      return true;
    } catch (e) {
      return false;
    }
  }
}
