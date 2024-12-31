import 'dart:io';
import 'dart:typed_data';

import '../../common/functional_extender.dart';
import '../api/barrel.dart' as saf;

extension UriDocumentFileUtils on Uri {
  /// {@macro sharedstorage.saf.fromTreeUri}
  Future<DocumentFile?> toDocumentFile() => DocumentFile.fromTreeUri(this);

  /// {@macro sharedstorage.saf.openDocumentFile}
  Future<void> openDocumentFile() => saf.openDocumentFile(this);
}

/// Equivalent to Android `DocumentFile` class
///
/// [Refer to details](https://developer.android.com/reference/androidx/documentfile/provider/DocumentFile)
class DocumentFile {
  const DocumentFile({
    required this.id,
    required this.parentUri,
    required this.size,
    required this.name,
    required this.type,
    required this.uri,
    required this.isDirectory,
    required this.isFile,
    required this.isVirtual,
    required this.lastModified,
  });

  factory DocumentFile.fromMap(Map<String, dynamic> map) {
    return DocumentFile(
      parentUri: (map['parentUri'] as String?)?.apply((p) => Uri.parse(p)),
      id: map['id'] as String?,
      isDirectory: map['isDirectory'] as bool?,
      isFile: map['isFile'] as bool?,
      isVirtual: map['isVirtual'] as bool?,
      name: map['name'] as String?,
      type: map['type'] as String?,
      uri: Uri.parse(map['uri'] as String),
      size: map['size'] as int?,
      lastModified: (map['lastModified'] as int?)
          ?.apply((l) => DateTime.fromMillisecondsSinceEpoch(l)),
    );
  }

  /// Display name of this document file, useful to show as a title in a list of files.
  final String? name;

  /// Mimetype of this document file, useful to determine how to display it.
  final String? type;

  /// Path, URI, location of this document, it can exists or not, you should check by using `exists()` API.
  final Uri uri;

  /// Uri of the parent document of [this] document.
  final Uri? parentUri;

  /// Generally represented as `primary:/Some/Resource` and can be used to identify the current document file.
  ///
  /// See [this diagram](https://raw.githubusercontent.com/anggrayudi/SimpleStorage/master/art/terminology.png) for details, source: [anggrayudi/SimpleStorage](https://github.com/anggrayudi/SimpleStorage).
  final String? id;

  /// Size of a document in bytes
  final int? size;

  /// Whether this document is a directory or not.
  ///
  /// Since it's a [DocumentFile], it can represent a folder/directory rather than a file.
  final bool? isDirectory;

  /// Indicates if this [DocumentFile] represents a _file_.
  ///
  /// Be aware there are several differences between documents and traditional files:
  /// - Documents express their display name and MIME type as separate fields, instead of relying on file extensions.
  /// Some documents providers may still choose to append extensions to their display names, but that's an implementation detail.
  /// - A single document may appear as the child of multiple directories, so it doesn't inherently know who its parent is.
  /// That is, documents don't have a strong notion of path.
  /// You can easily traverse a tree of documents from parent to child, but not from child to parent.
  /// - Each document has a unique identifier within that provider.
  /// This identifier is an opaque implementation detail of the provider, and as such it must not be parsed.
  ///
  /// [Android Reference](https://developer.android.com/reference/androidx/documentfile/provider/DocumentFile#:~:text=androidx.documentfile.provider.DocumentFile,but%20it%20has%20substantial%20overhead.()
  final bool? isFile;

  /// Indicates if this file represents a virtual document.
  ///
  /// What is a virtual document?
  /// - [Video answer](https://www.youtube.com/watch?v=4h7yCZt231Y)
  /// - [Text docs answer](https://developer.android.com/about/versions/nougat/android-7.0#virtual_files)
  final bool? isVirtual;

  /// {@macro sharedstorage.saf.fromTreeUri}
  static Future<DocumentFile?> fromTreeUri(Uri uri) => saf.fromTreeUri(uri);

  /// {@macro sharedstorage.saf.child}
  @willbemovedsoon
  Future<DocumentFile?> child(
    String path, {
    bool requiresWriteAccess = false,
  }) =>
      saf.child(uri, path, requiresWriteAccess: requiresWriteAccess);

  /// {@macro sharedstorage.saf.openDocumentFile}
  Future<bool?> openDocumentFile() => saf.openDocumentFile(uri);

  /// {@macro sharedstorage.saf.openDocumentFile}
  ///
  /// Alias/shortname for [openDocumentFile]
  Future<bool?> open() => openDocumentFile();

  /// {@macro sharedstorage.saf.canRead}
  Future<bool?> canRead() async => saf.canRead(uri);

  /// {@macro sharedstorage.saf.canWrite}
  Future<bool?> canWrite() async => saf.canWrite(uri);

  /// {@macro sharedstorage.saf.exists}
  Future<bool?> exists() => saf.exists(uri);

  /// {@macro sharedstorage.saf.delete}
  Future<bool?> delete() => saf.delete(uri);

  /// {@macro sharedstorage.saf.copy}
  Future<DocumentFile?> copy(Uri destination) => saf.copy(uri, destination);

  /// {@macro sharedstorage.saf.getDocumentContent}
  Future<Uint8List?> getContent() => saf.getDocumentContent(uri);

  /// {@macro sharedstorage.saf.getContentAsString}
  Future<String?> getContentAsString() => saf.getDocumentContentAsString(uri);

  /// {@macro sharedstorage.saf.createDirectory}
  Future<DocumentFile?> createDirectory(String displayName) =>
      saf.createDirectory(uri, displayName);

  /// {@macro sharedstorage.saf.createFileAsBytes}
  Future<DocumentFile?> createFileAsBytes({
    required String mimeType,
    required String displayName,
    required Uint8List bytes,
  }) =>
      saf.createFile(
        uri,
        mimeType: mimeType,
        displayName: displayName,
        bytes: bytes,
      );

  /// {@macro sharedstorage.saf.createFile}
  Future<DocumentFile?> createFile({
    required String mimeType,
    required String displayName,
    String content = '',
    Uint8List? bytes,
  }) =>
      saf.createFile(
        uri,
        mimeType: mimeType,
        displayName: displayName,
        content: content,
        bytes: bytes,
      );

  /// Alias for [createFile] with [content] param
  Future<DocumentFile?> createFileAsString({
    required String mimeType,
    required String displayName,
    required String content,
  }) =>
      saf.createFile(
        uri,
        mimeType: mimeType,
        displayName: displayName,
        content: content,
      );

  /// {@macro sharedstorage.saf.writeToFileAsBytes}
  Future<bool?> writeToFileAsBytes({
    required Uint8List bytes,
    FileMode? mode,
  }) =>
      saf.writeToFileAsBytes(
        uri,
        bytes: bytes,
        mode: mode,
      );

  /// {@macro sharedstorage.saf.writeToFile}
  Future<bool?> writeToFile({
    String? content,
    Uint8List? bytes,
    FileMode? mode,
  }) =>
      saf.writeToFile(
        uri,
        content: content,
        bytes: bytes,
        mode: mode,
      );

  /// Alias for [writeToFile] with [content] param
  Future<bool?> writeToFileAsString({
    required String content,
    FileMode? mode,
  }) =>
      saf.writeToFile(
        uri,
        content: content,
        mode: mode,
      );

  /// {@macro sharedstorage.saf.lastModified}
  final DateTime? lastModified;

  /// {@macro sharedstorage.saf.findFile}
  Future<DocumentFile?> findFile(String displayName) =>
      saf.findFile(uri, displayName);

  /// {@macro sharedstorage.saf.renameTo}
  Future<DocumentFile?> renameTo(String displayName) =>
      saf.renameTo(uri, displayName);

  /// {@macro sharedstorage.saf.parentFile}
  Future<DocumentFile?> parentFile() => saf.parentFile(uri);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uri': '$uri',
      'parentUri': '$parentUri',
      'isDirectory': isDirectory,
      'isFile': isFile,
      'isVirtual': isVirtual,
      'name': name,
      'type': type,
      'size': size,
      'lastModified': lastModified?.millisecondsSinceEpoch,
    };
  }

  @override
  bool operator ==(Object other) {
    if (other is! DocumentFile) return false;

    return id == other.id &&
        parentUri == other.parentUri &&
        isDirectory == other.isDirectory &&
        isFile == other.isFile &&
        isVirtual == other.isVirtual &&
        name == other.name &&
        type == other.type &&
        uri == other.uri;
  }

  @override
  int get hashCode =>
      Object.hash(isDirectory, isFile, isVirtual, name, type, uri);
}
