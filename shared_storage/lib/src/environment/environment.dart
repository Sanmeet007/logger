import 'dart:io';

import '../channels.dart';
import 'common.dart';
import 'environment_directory.dart';

/// Equivalent to `Environment.getRootDirectory`
///
/// [Refer to details](https://developer.android.com/reference/android/os/Environment#getRootDirectory%28%29)
@Deprecated(
  'Android specific APIs will be removed soon in order to be replaced with a new set of original cross-platform APIs.',
)
Future<Directory?> getRootDirectory() async {
  const kGetRootDirectory = 'getRootDirectory';

  return invokeVoidEnvironmentMethod(kGetRootDirectory);
}

/// Equivalent to `Environment.getExternalStoragePublicDirectory`.
///
/// _Added in API level 8_.
///
/// _Deprecated in API level 29_.
///
/// See [EnvironmentDirectory] to see all available directories.
///
/// See [how to migrate](https://stackoverflow.com/questions/56468539/getexternalstoragepublicdirectory-deprecated-in-android-q) from this deprecated API.
///
/// [Refer to details](https://developer.android.com/reference/android/os/Environment#getExternalStoragePublicDirectory%28java.lang.String%29)
@Deprecated(
  '''Deprecated in API level 29 (Android 10+) and was deprecated in this package after v0.3.0.\nSee how to migrate: https://stackoverflow.com/questions/56468539/getexternalstoragepublicdirectory-deprecated-in-android-q''',
)
Future<Directory?> getExternalStoragePublicDirectory(
  EnvironmentDirectory directory,
) async {
  const kGetExternalStoragePublicDirectory =
      'getExternalStoragePublicDirectory';
  const kDirectoryArg = 'directory';

  final args = <String, String>{kDirectoryArg: '$directory'};

  final publicDir = await kEnvironmentChannel.invokeMethod<String?>(
    kGetExternalStoragePublicDirectory,
    args,
  );

  if (publicDir == null) return null;

  return Directory(publicDir);
}

/// Equivalent to `Environment.getExternalStorageDirectory`
///
/// [Refer to details](https://developer.android.com/reference/android/os/Environment#getExternalStorageDirectory%28%29)
@Deprecated(
  'Android specific APIs will be removed soon in order to be replaced with a new set of original cross-platform APIs.',
)
Future<Directory?> getExternalStorageDirectory() async {
  const kGetExternalStorageDirectory = 'getExternalStorageDirectory';

  return invokeVoidEnvironmentMethod(kGetExternalStorageDirectory);
}

/// Equivalent to `Environment.getDataDirectory`
///
/// [Refer to details](https://developer.android.com/reference/android/os/Environment#getDataDirectory%28%29)
@Deprecated(
  'Android specific APIs will be removed soon in order to be replaced with a new set of original cross-platform APIs.',
)
Future<Directory?> getDataDirectory() async {
  const kGetDataDirectory = 'getDataDirectory';

  return invokeVoidEnvironmentMethod(kGetDataDirectory);
}

/// Equivalent to `Environment.getDataDirectory`
///
/// [Refer to details](https://developer.android.com/reference/android/os/Environment#getDownloadCacheDirectory%28%29)
@Deprecated(
  'Android specific APIs will be removed soon in order to be replaced with a new set of original cross-platform APIs.',
)
Future<Directory?> getDownloadCacheDirectory() async {
  const kGetDownloadCacheDirectory = 'getDownloadCacheDirectory';

  return invokeVoidEnvironmentMethod(kGetDownloadCacheDirectory);
}

/// Equivalent to `Environment.getStorageDirectory`
///
/// [Refer to details](https://developer.android.com/reference/android/os/Environment#getStorageDirectory%28%29)
@Deprecated(
  'Android specific APIs will be removed soon in order to be replaced with a new set of original cross-platform APIs.',
)
Future<Directory?> getStorageDirectory() {
  const kGetStorageDirectory = 'getStorageDirectory';

  return invokeVoidEnvironmentMethod(kGetStorageDirectory);
}
