import 'package:collection/collection.dart';

class EpubChapter {
  String? Title;
  String? ContentFileName;
  String? Anchor;
  String? HtmlContent;
  List<EpubChapter>? SubChapters;

  @override
  int get hashCode => Object.hash(Title, ContentFileName, Anchor, HtmlContent)
    ^ ListEquality().hash(SubChapters);

  @override
  bool operator ==(Object? other) {
    return other is EpubChapter &&
        Title == other.Title &&
        ContentFileName == other.ContentFileName &&
        Anchor == other.Anchor &&
        HtmlContent == other.HtmlContent &&
        ListEquality().equals(SubChapters, other.SubChapters);
  }

  @override
  String toString() {
    return 'Title: $Title, Subchapter count: ${SubChapters?.length}';
  }
}
