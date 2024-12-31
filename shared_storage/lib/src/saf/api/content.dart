import 'dart:typed_data';

import '../../channels.dart';
import '../../common/functional_extender.dart';
import '../models/barrel.dart';

/// {@template sharedstorage.saf.getDocumentContentAsString}
/// Helper method to read document using
/// `getDocumentContent` and get the content as String instead as `Uint8List`.
/// {@endtemplate}
Future<String?> getDocumentContentAsString(
  Uri uri, {
  bool throwIfError = false,
}) async {
  final bytes = await getDocumentContent(uri);

  if (bytes == null) return null;

  return String.fromCharCodes(bytes);
}

/// {@template sharedstorage.saf.getDocumentContent}
/// Get content of a given document `uri`.
///
/// Equivalent to `contentDescriptor` usage.
///
/// [Refer to details](https://developer.android.com/training/data-storage/shared/documents-files#input_stream).
/// {@endtemplate}
Future<Uint8List?> getDocumentContent(Uri uri) async =>
    kDocumentFileChannel.invokeMethod<Uint8List>(
      'getDocumentContent',
      <String, String>{'uri': '$uri'},
    );

/// {@template sharedstorage.saf.getDocumentThumbnail}
/// Equivalent to `DocumentsContract.getDocumentThumbnail`.
///
/// [Refer to details](https://developer.android.com/reference/android/provider/DocumentsContract#getDocumentThumbnail(android.content.ContentResolver,%20android.net.Uri,%20android.graphics.Point,%20android.os.CancellationSignal)).
/// {@endtemplate}
Future<DocumentBitmap?> getDocumentThumbnail({
  required Uri uri,
  required double width,
  required double height,
}) async {
  final args = <String, dynamic>{
    'uri': '$uri',
    'width': width,
    'height': height,
  };

  final bitmap = await kDocumentsContractChannel
      .invokeMapMethod<String, dynamic>('getDocumentThumbnail', args);

  return bitmap?.apply((b) => DocumentBitmap.fromMap(b));
}
