import '../common/barrel.dart';
import '../models/barrel.dart';

/// {@template sharedstorage.saf.fromTreeUri}
/// Create a new `DocumentFile` instance given `uri`.
///
/// Equivalent to `DocumentFile.fromTreeUri`.
///
/// [Refer to details](https://developer.android.com/reference/androidx/documentfile/provider/DocumentFile#fromTreeUri%28android.content.Context,%20android.net.Uri%29).
/// {@endtemplate}
Future<DocumentFile?> fromTreeUri(Uri uri) async =>
    invokeMapMethod('fromTreeUri', <String, String>{'uri': '$uri'});
