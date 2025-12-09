import 'dart:isolate';
import 'package:uri_content/uri_content.dart';
import 'package:flutter/services.dart';

const _methodChannelPlatform = MethodChannel("com.logger.app/imp_cl_fmc");

// Top level fn required by isolate.run
Future<bool> _insertCallLogs(Map params) async {
  final List<Map<String, dynamic>> callLogs = params["logs"];
  final RootIsolateToken rootIsolateToken = params["token"];

  try {
    int batchSize = 100;
    // Ensure BackgroundIsolateBinaryMessenger is initialized
    BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);

    for (int i = 0; i < callLogs.length; i += batchSize) {
      final batch = callLogs.sublist(
          i, i + batchSize > callLogs.length ? callLogs.length : i + batchSize);

      bool success =
          await _methodChannelPlatform.invokeMethod('insertCallLogs', batch);
      if (!success) {
        return false;
      }
      // Short delay
      await Future.delayed(const Duration(milliseconds: 100));
    }
    return true;
  } on PlatformException catch (_) {
    return false;
  }
}

// Top level fn required by isolate.run
Future<bool> _fixCallLogCachedName(Map params) async {
  final RootIsolateToken rootIsolateToken = params["token"];

  try {
    // Ensure BackgroundIsolateBinaryMessenger is initialized
    BackgroundIsolateBinaryMessenger.ensureInitialized(rootIsolateToken);

    bool success = await _methodChannelPlatform.invokeMethod('fixCallLogs');
    if (!success) {
      return false;
    }

    return true;
  } on PlatformException catch (_) {
    return false;
  }
}

class NativeMethods {
  static Future<Uint8List?> getContactPhotoFromUri(String? uriString) async {
    if (uriString == null || uriString.isEmpty) return null;

    try {
      final bytes = await UriContent().fromOrNull(Uri.parse(uriString));
      return bytes;
    } catch (e) {
      return null;
    }
  }

  static Future<bool> addToContacts(String phoneNumber) async {
    try {
      bool success = await _methodChannelPlatform
          .invokeMethod('addContact', {'phoneNumber': phoneNumber});
      return success;
    } on PlatformException catch (_) {
      return false;
    }
  }

  static Future<bool> openContact(String phoneNumber) async {
    try {
      bool success = await _methodChannelPlatform
          .invokeMethod('openContact', {'phoneNumber': phoneNumber});
      return success;
    } on PlatformException catch (_) {
      return false;
    }
  }
}

class CallLogWriter {
  static Future<bool> batchInsertCallLogs(
      final List<Map<String, dynamic>> callLogs) {
    RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;

    return Isolate.run(
      () {
        return _insertCallLogs({
          "logs": callLogs,
          "token": rootIsolateToken,
        });
      },
    );
  }

  static Future<bool> fixCallLogCachedName() {
    RootIsolateToken rootIsolateToken = RootIsolateToken.instance!;

    return Isolate.run(
      () {
        return _fixCallLogCachedName({
          "token": rootIsolateToken,
        });
      },
    );
  }
}
