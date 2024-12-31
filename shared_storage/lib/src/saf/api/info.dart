import '../../channels.dart';
import '../../common/functional_extender.dart';

/// {@template sharedstorage.saf.length}
/// Equivalent to `DocumentFile.length`.
///
/// Returns the size of a given document `uri` in bytes.
///
/// [Refer to details](https://developer.android.com/reference/androidx/documentfile/provider/DocumentFile#length%28%29).
/// {@endtemplate}
Future<int?> documentLength(Uri uri) async => kDocumentFileChannel
    .invokeMethod<int>('length', <String, String>{'uri': '$uri'});

/// {@template sharedstorage.saf.lastModified}
/// Equivalent to `DocumentFile.lastModified`.
///
/// [Refer to details](https://developer.android.com/reference/androidx/documentfile/provider/DocumentFile#lastModified%28%29).
/// {@endtemplate}
Future<DateTime?> lastModified(Uri uri) async {
  const kLastModified = 'lastModified';

  final inMillisecondsSinceEpoch = await kDocumentFileChannel
      .invokeMethod<int>(kLastModified, <String, String>{'uri': '$uri'});

  return inMillisecondsSinceEpoch
      ?.takeIf((i) => i > 0)
      ?.apply((i) => DateTime.fromMillisecondsSinceEpoch(i));
}

/// {@template sharedstorage.saf.canRead}
/// Equivalent to `DocumentFile.canRead`.
///
/// [Refer to details](https://developer.android.com/reference/androidx/documentfile/provider/DocumentFile#canRead()).
/// {@endtemplate}
Future<bool?> canRead(Uri uri) async => kDocumentFileChannel
    .invokeMethod<bool>('canRead', <String, String>{'uri': '$uri'});

/// {@template sharedstorage.saf.canWrite}
/// Equivalent to `DocumentFile.canWrite`.
///
/// [Refer to details](https://developer.android.com/reference/androidx/documentfile/provider/DocumentFile#canWrite()).
/// {@endtemplate}
Future<bool?> canWrite(Uri uri) async => kDocumentFileChannel
    .invokeMethod<bool>('canWrite', <String, String>{'uri': '$uri'});

/// {@template sharedstorage.saf.exists}
///  Equivalent to `DocumentFile.exists`.
///
/// Verify wheter or not a given [uri] exists.
///
/// [Refer to details](https://developer.android.com/reference/androidx/documentfile/provider/DocumentFile#exists()).
/// {@endtemplate}
Future<bool?> exists(Uri uri) async => kDocumentFileChannel
    .invokeMethod<bool>('exists', <String, String>{'uri': '$uri'});
