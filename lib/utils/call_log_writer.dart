import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class CallLogWriter {
  static const _methodChannelPlatform =
      MethodChannel("com.logger.app/imp_cl_fmc");

  static Future<bool> _insertCallLogs(Map params) async {
    final List<Map<String, dynamic>> callLogs = params["logs"];
    final RootIsolateToken rootIsolateToken = params["token"];

    try {
      // Ensure BackgroundIsolateBinaryMessenger is initialized
      BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);

      await _methodChannelPlatform.invokeMethod('insertCallLogs', callLogs);

      return true;
    } on PlatformException catch (_) {
      return false;
    }
  }

  static Future<bool> insertCallLogs(
      final List<Map<String, dynamic>> callLogs) {
    RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;
    return compute(_insertCallLogs, {
      "logs": callLogs,
      "token": rootIsolateToken,
    });
  }

  static Future<bool> batchInsertCallLogs(
      final List<Map<String, dynamic>> callLogs,
      {int batchSize = 100}) async {
    for (int i = 0; i < callLogs.length; i += batchSize) {
      final batch = callLogs.sublist(
          i, i + batchSize > callLogs.length ? callLogs.length : i + batchSize);

      bool success = await insertCallLogs(batch);
      if (!success) {
        return false;
      }
      // Short delay
      await Future.delayed(const Duration(milliseconds: 100));
    }
    return true;
  }
}
