import 'dart:typed_data';

import '../../channels.dart';
import '../../common/functional_extender.dart';
import '../common/barrel.dart';
import '../models/barrel.dart';

/// {@template sharedstorage.saf.createDirectory}
/// Create a direct child document tree named `displayName` given a parent `parentUri`.
///
/// Equivalent to `DocumentFile.createDirectory`.
///
/// [Refer to details](https://developer.android.com/reference/androidx/documentfile/provider/DocumentFile#createDirectory%28java.lang.String%29).
/// {@endtemplate}
Future<DocumentFile?> createDirectory(Uri parentUri, String displayName) async {
  final args = <String, String>{
    'uri': '$parentUri',
    'displayName': displayName,
  };

  final createdDocumentFile = await kDocumentFileChannel
      .invokeMapMethod<String, dynamic>('createDirectory', args);

  return createdDocumentFile?.apply((c) => DocumentFile.fromMap(c));
}

/// {@template sharedstorage.saf.createFile}
/// Convenient method to create files using either [String] or raw bytes [Uint8List].
///
/// Under the hood this method calls `createFileAsString` or `createFileAsBytes`
/// depending on which argument is passed.
///
/// If both (bytes and content) are passed, the bytes will be used and the content will be ignored.
/// {@endtemplate}
Future<DocumentFile?> createFile(
  Uri parentUri, {
  required String mimeType,
  required String displayName,
  Uint8List? bytes,
  String content = '',
}) {
  return bytes != null
      ? createFileAsBytes(
          parentUri,
          mimeType: mimeType,
          displayName: displayName,
          bytes: bytes,
        )
      : createFileAsString(
          parentUri,
          mimeType: mimeType,
          displayName: displayName,
          content: content,
        );
}

/// {@template sharedstorage.saf.createFileAsBytes}
/// Create a direct child document of `parentUri`.
/// - `mimeType` is the type of document following [this specs](https://www.iana.org/assignments/media-types/media-types.xhtml).
/// - `displayName` is the name of the document, must be a valid file name.
/// - `bytes` is the content of the document as a list of bytes `Uint8List`.
///
/// Returns the created file as a `DocumentFile`.
///
/// Mirror of [`DocumentFile.createFile`](https://developer.android.com/reference/androidx/documentfile/provider/DocumentFile#createFile(java.lang.String,%20java.lang.String))
/// {@endtemplate}
Future<DocumentFile?> createFileAsBytes(
  Uri parentUri, {
  required String mimeType,
  required String displayName,
  required Uint8List bytes,
}) async {
  final directoryUri = '$parentUri';

  final args = <String, dynamic>{
    'mimeType': mimeType,
    'content': bytes,
    'displayName': displayName,
    'directoryUri': directoryUri,
  };

  return invokeMapMethod('createFile', args);
}

/// {@template sharedstorage.saf.createFileAsString}
/// Convenient method to create a file.
/// using `content` as String instead Uint8List.
/// {@endtemplate}
Future<DocumentFile?> createFileAsString(
  Uri parentUri, {
  required String mimeType,
  required String displayName,
  required String content,
}) {
  return createFileAsBytes(
    parentUri,
    displayName: displayName,
    mimeType: mimeType,
    bytes: Uint8List.fromList(content.codeUnits),
  );
}
