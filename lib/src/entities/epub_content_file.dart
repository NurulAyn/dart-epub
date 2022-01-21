
import 'epub_content_type.dart';

abstract class EpubContentFile {
  String? FileName;
  EpubContentType? ContentType;
  String? ContentMimeType;

  @override
  int get hashCode =>
      Object.hash(FileName, ContentType, ContentMimeType);

  @override
  bool operator ==(Object? other) {
    return other is EpubContentFile &&
        FileName == other.FileName &&
        ContentType == other.ContentType &&
        ContentMimeType == other.ContentMimeType;
  }
}
