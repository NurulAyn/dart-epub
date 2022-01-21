library epubreadertest;

import 'package:archive/archive.dart';
import 'package:epub/epub.dart';
import 'package:epub/src/ref_entities/epub_chapter_ref.dart';
import 'package:epub/src/ref_entities/epub_text_content_file_ref.dart';
import 'package:test/test.dart';
import '../obj_ref.dart';

main() async {
  var arch = new Archive();
  var bookRef = new EpubBookRef(arch);
  var contentFileRef = new EpubTextContentFileRef(bookRef);
  var reference = new EpubChapterRef(contentFileRef);

  reference
    ..Anchor = 'anchor'
    ..ContentFileName = 'orthros'
    ..SubChapters = []
    ..Title = 'A New Look at Chapters';

  var bookRef2 = ObjRef<EpubBookRef>();
  var testChapterRef = ObjRef<EpubChapterRef>();
  setUp(() async {
    var arch2 = new Archive();
    bookRef2.value = new EpubBookRef(arch2);
    var contentFileRef2 = new EpubTextContentFileRef(bookRef2.value);

    testChapterRef.value = new EpubChapterRef(contentFileRef2);
    testChapterRef.value
      ..Anchor = reference.Anchor
      ..ContentFileName = reference.ContentFileName
      ..SubChapters = reference.SubChapters
      ..Title = reference.Title;
  });

  tearDown(() async {
    testChapterRef.value = null;
    bookRef2.value = null;
  });
  group('EpubChapterRef', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testChapterRef.value, equals(reference));
      });

      test('is false when Anchor changes', () async {
        testChapterRef.value.Anchor = 'NotAnAnchor';
        expect(testChapterRef.value, isNot(reference));
      });

      test('is false when ContentFileName changes', () async {
        testChapterRef.value.ContentFileName = 'NotOrthros';
        expect(testChapterRef.value, isNot(reference));
      });

      test('is false when SubChapters changes', () async {
        var subchapterContentFileRef = new EpubTextContentFileRef(bookRef2.value);
        var chapter = new EpubChapterRef(subchapterContentFileRef);
        chapter
          ..Title = 'A Brave new Epub'
          ..ContentFileName = 'orthros.txt';
        testChapterRef.value.SubChapters = [chapter];
        expect(testChapterRef.value, isNot(reference));
      });

      test('is false when Title changes', () async {
        testChapterRef.value.Title = 'A Boring Old World';
        expect(testChapterRef.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testChapterRef.value.hashCode, equals(reference.hashCode));
      });

      test('is true for equivalent objects', () async {
        expect(testChapterRef.value.hashCode, equals(reference.hashCode));
      });

      test('is false when Anchor changes', () async {
        testChapterRef.value.Anchor = 'NotAnAnchor';
        expect(testChapterRef.value.hashCode, isNot(reference.hashCode));
      });

      test('is false when ContentFileName changes', () async {
        testChapterRef.value.ContentFileName = 'NotOrthros';
        expect(testChapterRef.value.hashCode, isNot(reference.hashCode));
      });

      test('is false when SubChapters changes', () async {
        var subchapterContentFileRef = new EpubTextContentFileRef(bookRef2.value);
        var chapter = new EpubChapterRef(subchapterContentFileRef);
        chapter
          ..Title = 'A Brave new Epub'
          ..ContentFileName = 'orthros.txt';
        testChapterRef.value.SubChapters = [chapter];
        expect(testChapterRef.value, isNot(reference));
      });

      test('is false when Title changes', () async {
        testChapterRef.value.Title = 'A Boring Old World';
        expect(testChapterRef.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
