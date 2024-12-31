/// Representation of the [android.provider.MediaStore] Android SDK
///
/// [Refer to details](https://developer.android.com/reference/android/provider/MediaStore#summary)
class MediaStoreCollection {
  const MediaStoreCollection._(this.id);

  final String id;

  static const _kPrefix = 'MediaStoreCollection';

  /// Available for Android [10 to 12]
  ///
  /// Equivalent to:
  /// - [MediaStore.Audio]
  @Deprecated(
    'Android specific APIs will be removed soon in order to be replaced with a new set of original cross-platform APIs.',
  )
  static const audio = MediaStoreCollection._('$_kPrefix.Audio');

  /// Available for Android [10 to 12]
  ///
  /// Equivalent to:
  /// - [MediaStore.Downloads]
  @Deprecated(
    'Android specific APIs will be removed soon in order to be replaced with a new set of original cross-platform APIs.',
  )
  static const downloads = MediaStoreCollection._('$_kPrefix.Downloads');

  /// Available for Android [10 to 12]
  ///
  /// Equivalent to:
  /// - [MediaStore.Images]
  @Deprecated(
    'Android specific APIs will be removed soon in order to be replaced with a new set of original cross-platform APIs.',
  )
  static const images = MediaStoreCollection._('$_kPrefix.Images');

  /// Available for Android [10 to 12]
  ///
  /// Equivalent to:
  /// - [MediaStore.Video]
  @Deprecated(
    'Android specific APIs will be removed soon in order to be replaced with a new set of original cross-platform APIs.',
  )
  static const video = MediaStoreCollection._('$_kPrefix.Video');

  @override
  bool operator ==(Object other) {
    return other is MediaStoreCollection && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  @Deprecated(
    'Android specific APIs will be removed soon in order to be replaced with a new set of original cross-platform APIs.',
  )
  String toString() => id;
}
