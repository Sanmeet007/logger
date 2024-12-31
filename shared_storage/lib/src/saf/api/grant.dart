import '../../channels.dart';
import '../../common/functional_extender.dart';

/// {@template sharedstorage.saf.openDocumentTree}
/// Start Activity Action: Allow the user to pick a directory subtree.
///
/// When invoked, the system will display the various `DocumentsProvider`
/// instances installed on the device, letting the user navigate through them.
/// Apps can fully manage documents within the returned directory.
///
/// [Refer to details](https://developer.android.com/reference/android/content/Intent#ACTION_OPEN_DOCUMENT_TREE).
///
/// support the initial directory of the directory picker.
/// {@endtemplate}
Future<Uri?> openDocumentTree({
  bool grantWritePermission = true,
  bool persistablePermission = true,
  Uri? initialUri,
}) async {
  const kOpenDocumentTree = 'openDocumentTree';

  final args = <String, dynamic>{
    'grantWritePermission': grantWritePermission,
    'persistablePermission': persistablePermission,
    if (initialUri != null) 'initialUri': '$initialUri',
  };

  final selectedDirectoryUri =
      await kDocumentFileChannel.invokeMethod<String?>(kOpenDocumentTree, args);

  return selectedDirectoryUri?.apply((e) => Uri.parse(e));
}

/// [Refer to details](https://developer.android.com/reference/android/content/Intent#ACTION_OPEN_DOCUMENT).
Future<List<Uri>?> openDocument({
  Uri? initialUri,
  bool grantWritePermission = true,
  bool persistablePermission = true,
  String mimeType = '*/*',
  bool multiple = false,
}) async {
  const kOpenDocument = 'openDocument';

  final args = <String, dynamic>{
    if (initialUri != null) 'initialUri': '$initialUri',
    'grantWritePermission': grantWritePermission,
    'persistablePermission': persistablePermission,
    'mimeType': mimeType,
    'multiple': multiple,
  };

  final selectedUriList =
      await kDocumentFileChannel.invokeListMethod(kOpenDocument, args);

  return selectedUriList
      ?.apply((e) => e.map((e) => Uri.parse(e as String)).toList());
}
