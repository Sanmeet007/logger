import '../../channels.dart';

/// {@template sharedstorage.saf.delete}
/// Equivalent to `DocumentFile.delete`.
///
/// Returns `true` if deleted successfully.
///
/// [Refer to details](https://developer.android.com/reference/androidx/documentfile/provider/DocumentFile#delete%28%29).
/// {@endtemplate}
Future<bool?> delete(Uri uri) async => kDocumentFileChannel
    .invokeMethod<bool>('delete', <String, String>{'uri': '$uri'});
