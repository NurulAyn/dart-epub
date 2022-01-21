import 'dart:async';
import 'dart:convert';

import 'package:archive/archive.dart';

import '../entities/epub_content_type.dart';
import '../utils/zip_path_utils.dart';
import 'epub_book_ref.dart';
import '../utils/extensions.dart';

abstract class EpubContentFileRef {
  final EpubBookRef epubBookRef;

  String? FileName;

  EpubContentType? ContentType;
  String? ContentMimeType;

  EpubContentFileRef(this.epubBookRef);

  @override
  int get hashCode =>
      Object.hash(FileName, ContentMimeType, ContentType);

  @override
  bool operator ==(Object? other) {
    return (other is EpubContentFileRef &&
        other.FileName == FileName &&
        other.ContentMimeType == ContentMimeType &&
        other.ContentType == ContentType);
  }

  ArchiveFile getContentFileEntry() {
    var contentFilePath =
        ZipPathUtils.combine(epubBookRef.Schema!.ContentDirectoryPath!, FileName!);

    var contentFileEntry = epubBookRef.EpubArchive().files.firstWhereNullable(
            (ArchiveFile x) => x.name == contentFilePath);
    if (contentFileEntry == null) {
      throw Exception(
          'EPUB parsing error: file $contentFilePath not found in archive.');
    }

    return contentFileEntry;
  }

  List<int> getContentStream() {
    return openContentStream(getContentFileEntry());
  }

  List<int> openContentStream(ArchiveFile contentFileEntry) {
    var contentStream = <int>[];
    if (contentFileEntry.content == null) {
      throw Exception(
          'Incorrect EPUB file: content file \"$FileName\" specified in manifest is not found.');
    }
    contentStream.addAll(contentFileEntry.content);
    return contentStream;
  }

  Future<List<int>> readContentAsBytes() async {
    var contentFileEntry = getContentFileEntry();
    var content = openContentStream(contentFileEntry);
    return content;
  }

  Future<String> readContentAsText() async {
    var contentStream = getContentStream();
    var result = Utf8Codec().decode(contentStream);
    return result;
  }
}
