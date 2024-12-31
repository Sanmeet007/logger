import 'dart:io';
import 'dart:typed_data';

import '../../channels.dart';

/// {@template sharedstorage.saf.writeToFileAsBytes}
/// Write to a file.
/// - `uri` is the URI of the file.
/// - `bytes` is the content of the document as a list of bytes `Uint8List`.
/// - `mode` is the mode in which the file will be opened for writing. Use `FileMode.write` for truncating and `FileMode.append` for appending to the file.
///
/// Returns `true` if the file was successfully written to.
/// {@endtemplate}
Future<bool?> writeToFileAsBytes(
  Uri uri, {
  required Uint8List bytes,
  FileMode? mode,
}) async {
  final writeMode =
      mode == FileMode.append || mode == FileMode.writeOnlyAppend ? 'wa' : 'wt';

  final args = <String, dynamic>{
    'uri': '$uri',
    'content': bytes,
    'mode': writeMode,
  };

  return kDocumentFileChannel.invokeMethod<bool>('writeToFile', args);
}

/// {@template sharedstorage.saf.writeToFileAsString}
/// Convenient method to write to a file.
/// using `content` as [String] instead [Uint8List].
/// {@endtemplate}
Future<bool?> writeToFileAsString(
  Uri uri, {
  required String content,
  FileMode? mode,
}) {
  return writeToFileAsBytes(
    uri,
    bytes: Uint8List.fromList(content.codeUnits),
    mode: mode,
  );
}

/// {@template sharedstorage.saf.writeToFile}
/// Convenient method to write to a file using either [String] or raw bytes [Uint8List].
///
/// Under the hood this method calls `writeToFileAsString` or `writeToFileAsBytes`
/// depending on which argument is passed.
///
/// If both (bytes and content) are passed, the bytes will be used and the content will be ignored.
/// {@endtemplate}
Future<bool?> writeToFile(
  Uri uri, {
  Uint8List? bytes,
  String? content,
  FileMode? mode,
}) {
  assert(
    bytes != null || content != null,
    '''Either [bytes] or [content] should be provided''',
  );

  return bytes != null
      ? writeToFileAsBytes(
          uri,
          bytes: bytes,
          mode: mode,
        )
      : writeToFileAsString(
          uri,
          content: content!,
          mode: mode,
        );
}
