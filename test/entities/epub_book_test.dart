library epubreadertest;

import 'package:epub/epub.dart';
import 'package:epub/src/entities/epub_schema.dart';
import 'package:test/test.dart';
import '../obj_ref.dart';

main() async {
  var reference = new EpubBook();
  reference
    ..Author = 'orthros'
    ..AuthorList = ['orthros']
    ..Chapters = [new EpubChapter()]
    ..Content = new EpubContent()
    ..CoverImage = Image(100, 100)
    ..Schema = new EpubSchema()
    ..Title = 'A Dissertation on Epubs';

  var testBook = ObjRef<EpubBook>();
  setUp(() async {
    testBook.value = new EpubBook();
    testBook.value
      ..Author = reference.Author
      ..AuthorList = reference.AuthorList
      ..Chapters = reference.Chapters
      ..Content = reference.Content
      ..CoverImage = reference.CoverImage
      ..Schema = reference.Schema
      ..Title = reference.Title;
  });
  tearDown(() async {
    testBook.value = null;
  });
  group('EpubBook', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testBook.value, equals(reference));
      });

      test('is false when Content changes', () async {
        var file = new EpubTextContentFile();
        file
          ..Content = 'Hello'
          ..ContentMimeType = 'application/txt'
          ..ContentType = EpubContentType.OTHER
          ..FileName = 'orthros.txt';

        EpubContent content = new EpubContent();
        content.AllFiles['hello'] = file;
        testBook.value.Content = content;

        expect(testBook.value, isNot(reference));
      });

      test('is false when Author changes', () async {
        testBook.value.Author = 'NotOrthros';
        expect(testBook.value, isNot(reference));
      });

      test('is false when AuthorList changes', () async {
        testBook.value.AuthorList = ['NotOrthros'];
        expect(testBook.value, isNot(reference));
      });

      test('is false when Chapters changes', () async {
        var chapter = new EpubChapter();
        chapter
          ..Title = 'A Brave new Epub'
          ..ContentFileName = 'orthros.txt';
        testBook.value.Chapters = [chapter];
        expect(testBook.value, isNot(reference));
      });

      test('is false when CoverImage changes', () async {
        testBook.value.CoverImage = new Image(200, 200);
        expect(testBook.value, isNot(reference));
      });

      test('is false when Schema changes', () async {
        var schema = new EpubSchema();
        schema.ContentDirectoryPath = 'some/random/path';
        testBook.value.Schema = schema;
        expect(testBook.value, isNot(reference));
      });

      test('is false when Title changes', () async {
        testBook.value.Title = 'The Philosophy of Epubs';
        expect(testBook.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testBook.value.hashCode, equals(reference.hashCode));
      });

      test('is false when Content changes', () async {
        var file = new EpubTextContentFile();
        file
          ..Content = 'Hello'
          ..ContentMimeType = 'application/txt'
          ..ContentType = EpubContentType.OTHER
          ..FileName = 'orthros.txt';

        EpubContent content = new EpubContent();
        content.AllFiles['hello'] = file;
        testBook.value.Content = content;

        expect(testBook.value.hashCode, isNot(reference.hashCode));
      });

      test('is false when Author changes', () async {
        testBook.value.Author = 'NotOrthros';
        expect(testBook.value.hashCode, isNot(reference.hashCode));
      });

      test('is false when AuthorList changes', () async {
        testBook.value.AuthorList = ['NotOrthros'];
        expect(testBook.value.hashCode, isNot(reference.hashCode));
      });

      test('is false when Chapters changes', () async {
        var chapter = new EpubChapter();
        chapter
          ..Title = 'A Brave new Epub'
          ..ContentFileName = 'orthros.txt';
        testBook.value.Chapters = [chapter];
        expect(testBook.value.hashCode, isNot(reference.hashCode));
      });

      test('is false when CoverImage changes', () async {
        testBook.value.CoverImage = new Image(200, 200);
        expect(testBook.value.hashCode, isNot(reference.hashCode));
      });

      test('is false when Schema changes', () async {
        var schema = new EpubSchema();
        schema.ContentDirectoryPath = 'some/random/path';
        testBook.value.Schema = schema;
        expect(testBook.value.hashCode, isNot(reference.hashCode));
      });

      test('is false when Title changes', () async {
        testBook.value.Title = 'The Philosophy of Epubs';
        expect(testBook.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
