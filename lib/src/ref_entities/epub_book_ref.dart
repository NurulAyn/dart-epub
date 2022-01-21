import 'dart:async';

import 'package:archive/archive.dart';
import 'package:image/image.dart';
import 'package:collection/collection.dart';

import '../entities/epub_schema.dart';
import '../readers/book_cover_reader.dart';
import '../readers/chapter_reader.dart';
import 'epub_chapter_ref.dart';
import 'epub_content_ref.dart';

class EpubBookRef {
  final Archive _epubArchive;

  String? Title;
  String? Author;
  List<String>? AuthorList;
  EpubSchema? Schema;
  EpubContentRef? Content;

  EpubBookRef(this._epubArchive);

  @override
  int get hashCode => Object.hash(
        Title,
        Author,
        Schema,
        Content
      ) ^ ListEquality().hash(AuthorList);

  @override
  bool operator ==(Object? other) {
    return other is EpubBookRef &&
        Title == other.Title &&
        Author == other.Author &&
        Schema == other.Schema &&
        Content == other.Content &&
        ListEquality().equals(AuthorList, other.AuthorList);
  }

  Archive EpubArchive() {
    return _epubArchive;
  }

  Future<List<EpubChapterRef>> getChapters() async {
    return await ChapterReader.getChapters(this);
  }

  Future<Image?> readCover() async {
    return await BookCoverReader.readBookCover(this);
  }
}
