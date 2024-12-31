/// Description of a single Uri permission grant.
/// This grants may have been created via `Intent#FLAG_GRANT_READ_URI_PERMISSION`,
/// etc when sending an `Intent`, or explicitly through `Context#grantUriPermission(String, android.net.Uri, int)`.
///
/// [Refer to details](https://developer.android.com/reference/android/content/UriPermission).
class UriPermission {
  /// Even we allow create instances of this class avoid it and use
  /// `persistedUriPermissions` API instead
  const UriPermission({
    required this.isReadPermission,
    required this.isWritePermission,
    required this.persistedTime,
    required this.uri,
    required this.isTreeDocumentFile,
  });

  factory UriPermission.fromMap(Map<String, dynamic> map) {
    return UriPermission(
      isReadPermission: map['isReadPermission'] as bool,
      isWritePermission: map['isWritePermission'] as bool,
      persistedTime: map['persistedTime'] as int,
      uri: Uri.parse(map['uri'] as String),
      isTreeDocumentFile: map['isTreeDocumentFile'] as bool,
    );
  }

  /// Whether an [UriPermission] is created with [`FLAG_GRANT_READ_URI_PERMISSION`](https://developer.android.com/reference/android/content/Intent#FLAG_GRANT_READ_URI_PERMISSION)
  final bool isReadPermission;

  /// Whether an [UriPermission] is created with [`FLAG_GRANT_WRITE_URI_PERMISSION`](https://developer.android.com/reference/android/content/Intent#FLAG_GRANT_WRITE_URI_PERMISSION)
  final bool isWritePermission;

  /// Return the time when this permission was first persisted, in milliseconds
  /// since January 1, 1970 00:00:00.0 UTC. Returns `INVALID_TIME` if
  /// not persisted.
  ///
  /// [Refer to details](https://android.googlesource.com/platform/frameworks/base/+/master/core/java/android/content/UriPermission.java#77)
  final int persistedTime;

  /// Return the Uri this permission pertains to.
  ///
  /// [Refer to details](https://android.googlesource.com/platform/frameworks/base/+/master/core/java/android/content/UriPermission.java#56)
  final Uri uri;

  /// Whether or not a tree document file.
  ///
  /// Tree document files are granted through [openDocumentTree] method, that is, when the user select a folder-like tree document file.
  /// Document files are granted through [openDocument] method, that is, when the user select (a) specific(s) document files.
  ///
  /// Roughly you may consider it as a property to verify if [this] permission is over a folder or a single-file.
  final bool isTreeDocumentFile;

  @override
  bool operator ==(Object other) =>
      other is UriPermission &&
      isReadPermission == other.isReadPermission &&
      isWritePermission == other.isWritePermission &&
      persistedTime == other.persistedTime &&
      uri == other.uri &&
      isTreeDocumentFile == other.isTreeDocumentFile;

  @override
  int get hashCode => Object.hashAll(
        [
          isReadPermission,
          isWritePermission,
          persistedTime,
          uri,
          isTreeDocumentFile,
        ],
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isReadPermission': isReadPermission,
      'isWritePermission': isWritePermission,
      'persistedTime': persistedTime,
      'uri': '$uri',
      'isTreeDocumentFile': isTreeDocumentFile,
    };
  }

  @override
  String toString() => 'UriPermission('
      'isReadPermission: $isReadPermission, '
      'isWritePermission: $isWritePermission, '
      'persistedTime: $persistedTime, '
      'uri: $uri, '
      'isTreeDocumentFile: $isTreeDocumentFile)';
}
