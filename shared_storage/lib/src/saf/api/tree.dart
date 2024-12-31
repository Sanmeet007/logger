import '../../channels.dart';
import '../../common/functional_extender.dart';
import '../common/barrel.dart';
import '../models/barrel.dart';

/// {@template sharedstorage.saf.listFiles}
/// **Important**: Ensure you have read permission by calling `canRead` before calling `listFiles`.
///
/// Emits a new event for each child document file.
///
/// Works with small and large data file sets.
///
/// ```dart
/// /// Usage:
///
/// final myState = <DocumentFile>[];
///
/// final onDocumentFile = listFiles(myUri, [DocumentFileColumn.id]);
///
/// onDocumentFile.listen((document) {
///   myState.add(document);
///
///   final documentId = document.data?[DocumentFileColumn.id]
///
///   print('$documentId was added to state');
/// });
/// ```
///
/// [Refer to details](https://stackoverflow.com/questions/41096332/issues-traversing-through-directory-hierarchy-with-android-storage-access-framew).
/// {@endtemplate}
Stream<DocumentFile> listFiles(
  Uri uri, {
  required List<DocumentFileColumn> columns,
}) {
  final args = <String, dynamic>{
    'uri': '$uri',
    'event': 'listFiles',
    'columns': columns.map((e) => '$e').toList(),
  };

  final onCursorRowResult =
      kDocumentFileEventChannel.receiveBroadcastStream(args);

  return onCursorRowResult.map((e) => DocumentFile.fromMap(Map.from(e as Map)));
}

/// {@template sharedstorage.saf.child}
/// Return the `child` of the given `uri` if it exists otherwise `null`.
///
/// It's faster than [DocumentFile.findFile]
/// `path` is the single file name or file path. Empty string returns to itself.
///
/// Equivalent to `DocumentFile.child` extension/overload.
///
/// [Refer to details](https://developer.android.com/reference/androidx/documentfile/provider/DocumentFile#fromTreeUri%28android.content.Context,%20android.net.Uri%29)
/// {@endtemplate}
@willbemovedsoon
Future<DocumentFile?> child(
  Uri uri,
  String path, {
  bool requiresWriteAccess = false,
}) async {
  final args = <String, dynamic>{
    'uri': '$uri',
    'path': path,
    'requiresWriteAccess': requiresWriteAccess,
  };

  return invokeMapMethod('child', args);
}

/// {@template sharedstorage.saf.parentFile}
/// Get the parent file of the given `uri`.
///
/// Equivalent to `DocumentFile.getParentFile`.
///
/// [Refer to details](https://developer.android.com/reference/androidx/documentfile/provider/DocumentFile#getParentFile%28%29).
/// {@endtemplate}
Future<DocumentFile?> parentFile(Uri uri) async =>
    invokeMapMethod('parentFile', <String, String>{'uri': '$uri'});
