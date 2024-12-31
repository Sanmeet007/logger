import '../channels.dart';
import 'media_store_collection.dart';

/// The contract between the media provider and applications.
///
/// Get the directory of a given [MediaStoreCollection]
///
/// [Refer to details](https://developer.android.com/reference/android/provider/MediaStore#summary)
@Deprecated(
  'Android specific APIs will be removed soon in order to be replaced with a new set of original cross-platform APIs.',
)
Future<Uri?> getMediaStoreContentDirectory(
  MediaStoreCollection collection,
) async {
  const kGetMediaStoreContentDirectory = 'getMediaStoreContentDirectory';
  const kCollectionArg = 'collection';

  final args = <String, String>{kCollectionArg: '$collection'};

  final publicDir = await kMediaStoreChannel.invokeMethod<String?>(
    kGetMediaStoreContentDirectory,
    args,
  );

  if (publicDir == null) return null;

  return Uri.parse(publicDir);
}
