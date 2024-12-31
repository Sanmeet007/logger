import 'package:flutter/services.dart';

import '../../channels.dart';
import '../models/barrel.dart';

/// {@template sharedstorage.saf.openDocumentFile}
/// Alias for [openDocumentFileWithResult] that returns true if the target [uri]
/// was successfully launched, false otherwise.
/// {@endtemplate}
Future<bool> openDocumentFile(Uri uri) async {
  final OpenDocumentFileResult result = await openDocumentFileWithResult(uri);

  return result.success;
}

/// {@template sharedstorage.saf.openDocumentFileWithResult}
/// It's a convenience method to launch the default application associated
/// with the given MIME type and can't be considered an official SAF API.
///
/// Launch `ACTION_VIEW` intent to open the given document `uri`.
///
/// Returns a [OpenDocumentFileResult] that allows you handle all edge-cases.
/// {@endtemplate}
Future<OpenDocumentFileResult> openDocumentFileWithResult(Uri uri) async {
  try {
    await kDocumentFileHelperChannel.invokeMethod<void>(
      'openDocumentFile',
      <String, String>{'uri': '$uri'},
    );
    return OpenDocumentFileResult.launched;
  } on PlatformException catch (e) {
    switch (e.code) {
      case 'EXCEPTION_ACTIVITY_NOT_FOUND':
        return OpenDocumentFileResult.failedDueActivityNotFound;
      case 'EXCEPTION_CANT_OPEN_FILE_DUE_SECURITY_POLICY':
        return OpenDocumentFileResult.failedDueSecurityPolicy;
      case 'EXCEPTION_CANT_OPEN_DOCUMENT_FILE':
      default:
        return OpenDocumentFileResult.failedDueUnknownReason;
    }
  }
}
