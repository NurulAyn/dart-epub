import 'dart:async';

import 'package:collection/collection.dart';

import 'epub_text_content_file_ref.dart';

class EpubChapterRef {
  final EpubTextContentFileRef epubTextContentFileRef;

  String? Title;
  String? ContentFileName;
  String? Anchor;
  List<EpubChapterRef>? SubChapters;

  EpubChapterRef(this.epubTextContentFileRef);

  @override
  int get hashCode => Object.hash(
        Title,
        ContentFileName,
        Anchor,
        epubTextContentFileRef
      ) ^ ListEquality().hash(SubChapters);

  @override
  bool operator ==(Object? other) {
    return other is EpubChapterRef &&
        Title == other.Title &&
        ContentFileName == other.ContentFileName &&
        Anchor == other.Anchor &&
        epubTextContentFileRef == other.epubTextContentFileRef &&
        ListEquality().equals(SubChapters, other.SubChapters);
  }

  Future<String> readHtmlContent() async {
    return epubTextContentFileRef.readContentAsText();
  }

  @override
  String toString() {
    return 'Title: $Title, Subchapter count: ${SubChapters?.length}';
  }
}
