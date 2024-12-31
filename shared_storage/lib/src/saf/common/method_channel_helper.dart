import '../../channels.dart';
import '../models/barrel.dart';

/// Helper method to invoke a native SAF method and return a document file
/// if not null, shouldn't be called directly from non-package code
Future<DocumentFile?> invokeMapMethod(
  String method,
  Map<String, dynamic> args,
) async {
  final documentMap =
      await kDocumentFileChannel.invokeMapMethod<String, dynamic>(method, args);

  if (documentMap == null) return null;

  return DocumentFile.fromMap(documentMap);
}
