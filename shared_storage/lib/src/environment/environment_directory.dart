/// Enumeration to all fields of [android.os.Environment]
/// class available to API level 16 or higher
///
/// - You can also create a custom [EnvironmentDirectory]
/// by using [custom] constructor
///
/// - This generally returns a directory pointing to `/storage/emulated/0/[this]`
///
/// [Refer to details](https://developer.android.com/reference/android/os/Environment#fields_1)
class EnvironmentDirectory {
  const EnvironmentDirectory._(this.id);

  /// Define a custom [folder]
  const EnvironmentDirectory.custom(String folder) : id = folder;

  final String id;

  static const _kPrefix = 'EnvironmentDirectory';

  /// Available for Android [4.1 to 9.0]
  ///
  /// Equivalent to [Environment.DIRECTORY_ALARMS]
  @Deprecated(
    'Android specific APIs will be removed soon in order to be replaced with a new set of original cross-platform APIs.',
  )
  static const alarms = EnvironmentDirectory._('$_kPrefix.Alarms');

  /// Available for Android [4.1 to 9]
  ///
  /// Equivalent to:
  /// - [Environment.DIRECTORY_DCIM] on Android [4.1 to 9]
  @Deprecated(
    'Android specific APIs will be removed soon in order to be replaced with a new set of original cross-platform APIs.',
  )
  static const dcim = EnvironmentDirectory._('$_kPrefix.DCIM');

  /// Available for Android [4.1 to 9]
  ///
  /// Equivalent to:
  /// - [Environment.DIRECTORY_DOWNLOADS] on Android [4.1 to 9]
  @Deprecated(
    'Android specific APIs will be removed soon in order to be replaced with a new set of original cross-platform APIs.',
  )
  static const downloads = EnvironmentDirectory._('$_kPrefix.Downloads');

  /// Available for Android [4.1 to 9]
  ///
  /// - [Environment.DIRECTORY_MOVIES] on Android [4.1 to 9]
  @Deprecated(
    'Android specific APIs will be removed soon in order to be replaced with a new set of original cross-platform APIs.',
  )
  static const movies = EnvironmentDirectory._('$_kPrefix.Movies');

  /// Available for Android [4.1 to 9]
  ///
  /// - [Environment.DIRECTORY_MUSIC] on Android [4.1 to 9]
  @Deprecated(
    'Android specific APIs will be removed soon in order to be replaced with a new set of original cross-platform APIs.',
  )
  static const music = EnvironmentDirectory._('$_kPrefix.Music');

  /// Available for Android [4.1 to 9]
  ///
  /// - [Environment.DIRECTORY_NOTIFICATIONS] on Android [4.1 to 9]
  @Deprecated(
    'Android specific APIs will be removed soon in order to be replaced with a new set of original cross-platform APIs.',
  )
  static const notifications =
      EnvironmentDirectory._('$_kPrefix.Notifications');

  /// Available for Android [4.1 to 9]
  ///
  /// - [Environment.DIRECTORY_PICTURES] on Android [4.1 to 9]
  @Deprecated(
    'Android specific APIs will be removed soon in order to be replaced with a new set of original cross-platform APIs.',
  )
  static const pictures = EnvironmentDirectory._('$_kPrefix.Pictures');

  /// Available for Android [4.1 to 9]
  ///
  /// - [Environment.DIRECTORY_PODCASTS] on Android [4.1 to 9]
  @Deprecated(
    'Android specific APIs will be removed soon in order to be replaced with a new set of original cross-platform APIs.',
  )
  static const podcasts = EnvironmentDirectory._('$_kPrefix.Podcasts');

  /// Available for Android [4.1 to 9]
  ///
  /// - [Environment.DIRECTORY_RINGTONES] on Android [4.1 to 9]
  @Deprecated(
    'Android specific APIs will be removed soon in order to be replaced with a new set of original cross-platform APIs.',
  )
  static const ringtones = EnvironmentDirectory._('$_kPrefix.Ringtones');

  @override
  bool operator ==(Object other) {
    return other is EnvironmentDirectory && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => id;
}
