import 'dart:convert';
import 'dart:typed_data';

/// Represent the bitmap/image of a document.
///
/// Usually the thumbnail of the document.
///
/// The bitmap is represented as a base64 string.
///
/// Should be used to show a list/grid preview of a file list.
///
/// See also [getDocumentThumbnail].
class DocumentBitmap {
  const DocumentBitmap({
    required this.base64,
    required this.uri,
    required this.width,
    required this.height,
    required this.byteCount,
    required this.density,
  });

  factory DocumentBitmap.fromMap(Map<String, dynamic> map) {
    return DocumentBitmap(
      uri: (() {
        final uri = map['uri'] as String?;

        if (uri == null) return null;

        return Uri.parse(uri);
      })(),
      width: map['width'] as int?,
      height: map['height'] as int?,
      base64: map['base64'] as String?,
      byteCount: map['byteCount'] as int?,
      density: map['density'] as int?,
    );
  }

  final String? base64;
  final Uri? uri;
  final int? width;
  final int? height;
  final int? byteCount;
  final int? density;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uri': '$uri',
      'width': width,
      'height': height,
      'base64': base64,
      'byteCount': byteCount,
      'density': density,
    };
  }

  Uint8List? get bytes {
    if (base64 == null) return null;

    const codec = Base64Codec();

    return codec.decode(base64!);
  }

  @override
  bool operator ==(Object other) {
    if (other is! DocumentBitmap) return false;

    return other.byteCount == byteCount &&
        other.width == width &&
        other.height == height &&
        other.uri == uri &&
        other.density == density &&
        other.base64 == base64;
  }

  @override
  int get hashCode =>
      Object.hash(width, height, uri, density, byteCount, base64);
}
