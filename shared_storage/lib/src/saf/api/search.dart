import '../barrel.dart';
import '../common/barrel.dart';

/// {@template sharedstorage.saf.findFile}
/// Equivalent to `DocumentFile.findFile`.
///
/// If you want to check if a given document file exists by their [displayName] prefer using `child` instead.
///
/// [Refer to details](https://developer.android.com/reference/androidx/documentfile/provider/DocumentFile#findFile%28java.lang.String%29).
/// {@endtemplate}
Future<DocumentFile?> findFile(Uri directoryUri, String displayName) async {
  final args = <String, String>{
    'uri': '$directoryUri',
    'displayName': displayName,
  };

  return invokeMapMethod('findFile', args);
}
