import '../barrel.dart';
import '../common/barrel.dart';

/// {@template sharedstorage.saf.renameTo}
/// Rename the current document `uri` to a new `displayName`.
///
/// **Note: after using this method `uri` is not longer valid,
/// use the returned document instead**.
///
/// Returns the updated document.
///
/// Equivalent to `DocumentFile.renameTo`.
///
/// [Refer to details](https://developer.android.com/reference/androidx/documentfile/provider/DocumentFile#renameTo%28java.lang.String%29).
/// {@endtemplate}
Future<DocumentFile?> renameTo(Uri uri, String displayName) async =>
    invokeMapMethod(
      'renameTo',
      <String, String>{'uri': '$uri', 'displayName': displayName},
    );
