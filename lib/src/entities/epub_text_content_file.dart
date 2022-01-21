import 'epub_content_file.dart';

class EpubTextContentFile extends EpubContentFile {
  String? Content;

  @override
  int get hashCode => Object.hash(Content, ContentMimeType, ContentType, FileName);

  @override
  bool operator ==(Object? other) {
    return other is EpubTextContentFile &&
        Content == other.Content &&
        ContentMimeType == other.ContentMimeType &&
        ContentType == other.ContentType &&
        FileName == other.FileName;
  }
}
