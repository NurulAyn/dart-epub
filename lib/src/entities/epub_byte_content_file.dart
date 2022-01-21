import 'package:collection/collection.dart';
import 'epub_content_file.dart';

class EpubByteContentFile extends EpubContentFile {
  List<int>? Content;

  @override
  int get hashCode => Object.hash(ContentMimeType,
      ContentType, FileName) ^ ListEquality().hash(Content);

  @override
  bool operator ==(Object? other) {
    return other is EpubByteContentFile &&
        ListEquality().equals(Content, other.Content) &&
        ContentMimeType == other.ContentMimeType &&
        ContentType == other.ContentType &&
        FileName == other.FileName;
  }
}
