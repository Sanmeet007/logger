/// Representation of the available columns of `DocumentsContract.Document.<Column>`
///
/// [Refer to details](https://developer.android.com/reference/android/provider/DocumentsContract.Document)
enum DocumentFileColumn {
  /// Equivalent to [`COLUMN_DOCUMENT_ID`](https://developer.android.com/reference/android/provider/DocumentsContract.Document#COLUMN_DOCUMENT_ID)
  id('COLUMN_DOCUMENT_ID'),

  /// Equivalent to [`COLUMN_DISPLAY_NAME`](https://developer.android.com/reference/android/provider/DocumentsContract.Document#COLUMN_DISPLAY_NAME)
  displayName('COLUMN_DISPLAY_NAME'),

  /// Equivalent to [`COLUMN_MIME_TYPE`](https://developer.android.com/reference/android/provider/DocumentsContract.Document#COLUMN_MIME_TYPE)
  mimeType('COLUMN_MIME_TYPE'),

  /// Equivalent to [`COLUMN_LAST_MODIFIED`](https://developer.android.com/reference/android/provider/DocumentsContract.Document#COLUMN_LAST_MODIFIED)
  lastModified('COLUMN_LAST_MODIFIED'),

  /// Equivalent to [`COLUMN_SIZE`](https://developer.android.com/reference/android/provider/DocumentsContract.Document#COLUMN_SIZE)
  size('COLUMN_SIZE'),

  /// Equivalent to [`COLUMN_SUMMARY`](https://developer.android.com/reference/android/provider/DocumentsContract.Document#COLUMN_SUMMARY)
  summary('COLUMN_SUMMARY');

  const DocumentFileColumn(this.androidEnumItemName);

  static const _kAndroidEnumTypeName = 'DocumentFileColumn';

  final String androidEnumItemName;

  String get androidEnumItemId => '$_kAndroidEnumTypeName.$androidEnumItemName';

  @override
  String toString() => androidEnumItemId;
}
