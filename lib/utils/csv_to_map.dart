import 'dart:convert';
import 'dart:isolate';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

class CsvToMapConverter {
  static final Map<String, int> _callTypeMap = {
    "CallType.incoming": 1,
    "CallType.outgoing": 2,
    "CallType.missed": 3,
    "CallType.voiceMail": 4,
    "CallType.rejected": 5,
    "CallType.blocked": 6,
    "CallType.answeredExternally": 7,
    "CallType.unknown": 8,
    "CallType.wifiIncoming": 9,
    "CallType.wifiOutgoing": 10,
  };

  static const _csvConverter = CsvToListConverter();

  static Future<List<Map<String, dynamic>>> generateCsvMap(
      Uint8List fileContents) {
    RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;

    return Isolate.run(() {
      return _generateCsvMap({
        "file_contents": fileContents,
        "root_isolate_token": rootIsolateToken,
      });
    });
  }

  static Future<List<Map<String, dynamic>>> _generateCsvMap(Map params) async {
    final Uint8List fileContents = params["file_contents"];
    final RootIsolateToken rootIsolateToken = params["root_isolate_token"];

    BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);

    final csvString = utf8.decode(fileContents as List<int>);
    final list = _csvConverter.convert(
      csvString,
      convertEmptyTo: () => null,
      eol: "\n",
      shouldParseNumbers: false,
    );

    const int batchSize = 100; // batch size
    // TODO : Check the lengends length ,order and value(name)

    List legends = list[0];
    List<Map<String, dynamic>> allMaps = [];

    for (int i = 1; i < list.length; i += batchSize) {
      final end = (i + batchSize > list.length) ? list.length : i + batchSize;
      final batch = list.sublist(i, end);
      final processedBatch = _processBatch(batch, legends);
      allMaps.addAll(processedBatch);

      // Short delay to prevent UI freezing
      await Future.delayed(const Duration(milliseconds: 100));
    }

    return allMaps;
  }

  static List<Map<String, dynamic>> _processBatch(
      List<List<dynamic>> batch, List legends) {
    List<Map<String, dynamic>> maps = [];

    for (var l in batch) {
      Map<String, dynamic> map = {};
      for (int i = 0; i < legends.length; i++) {
        final legend = (legends[i] as String).trim();
        var v = l[i];
        if (legend == "call_type") {
          if (_callTypeMap.containsKey(v)) {
            map.putIfAbsent(legend, () => _callTypeMap[v]);
          } else {
            // Mark invalid call type to unknown
            map.putIfAbsent(legend, () => 8);
          }
        } else if (legend == "timestamp" ||
            legend == "duration" ||
            legend == "cached_number_type") {
          v = int.tryParse(v);
          map.putIfAbsent(legend, () => v);
        } else if (legend == "formatted_number" ||
            legend == "formattedNumber") {
          // OLD CSV FILES HAVE formattedNumber -> new Field is formatted_number
          if (v == "null") {
            v = null;
          }
          map.putIfAbsent("formatted_number", () => v);
        } else {
          if (v == "null") {
            v = null;
          }
          map.putIfAbsent(legend, () => v);
        }
      }
      maps.add(map);
    }

    return maps;
  }
}
