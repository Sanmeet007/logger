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
