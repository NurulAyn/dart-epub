import 'package:image/image.dart';
import 'package:collection/collection.dart';

import 'epub_chapter.dart';
import 'epub_content.dart';
import 'epub_schema.dart';

class EpubBook {
  String? Title;
  String? Author;
  List<String>? AuthorList;
  EpubSchema? Schema;
  EpubContent? Content;
  Image? CoverImage;
  List<EpubChapter>? Chapters;

  @override
  int get hashCode => Object.hash(Title, Author, Schema, Content, CoverImage, Chapters)
    ^ ListEquality().hash(AuthorList)
    ^ ListEquality().hash(Chapters);

  @override
  bool operator ==(Object? other) {
    return other is EpubBook &&
        Title == other.Title &&
        Author == other.Author &&
        ListEquality().equals(AuthorList, other.AuthorList) &&
        Schema == other.Schema &&
        Content == other.Content &&
        ListEquality().equals(
            CoverImage?.getBytes(), other.CoverImage?.getBytes()) &&
        ListEquality().equals(Chapters, other.Chapters);
  }
}
