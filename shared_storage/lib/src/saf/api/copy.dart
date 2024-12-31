import '../common/barrel.dart';
import '../models/barrel.dart';

/// {@template sharedstorage.saf.copy}
/// Copy a document `uri` to the `destination`.
///
/// This API uses the `createFile` and `getDocumentContent` API's behind the scenes.
/// {@endtemplate}
Future<DocumentFile?> copy(Uri uri, Uri destination) async {
  final args = <String, String>{'uri': '$uri', 'destination': '$destination'};

  return invokeMapMethod('copy', args);
}
