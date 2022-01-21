library epubreadertest;

import 'package:archive/archive.dart';
import 'package:epub/epub.dart';
import 'package:epub/src/entities/epub_schema.dart';
import 'package:epub/src/ref_entities/epub_content_ref.dart';
import 'package:epub/src/ref_entities/epub_text_content_file_ref.dart';
import 'package:test/test.dart';
import '../obj_ref.dart';

main() async {
  Archive arch = new Archive();
  var reference = new EpubBookRef(arch);
  reference
    ..Author = 'orthros'
    ..AuthorList = ['orthros']
    ..Schema = new EpubSchema()
    ..Title = 'A Dissertation on Epubs';

  var testBookRef = ObjRef<EpubBookRef>();
  setUp(() async {
    testBookRef.value = new EpubBookRef(arch);
    testBookRef.value
      ..Author = reference.Author
      ..AuthorList = reference.AuthorList
      ..Content = reference.Content
      ..Schema = reference.Schema
      ..Title = reference.Title;
  });
  tearDown(() async {
    testBookRef.value = null;
  });
  group('EpubBookRef', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testBookRef.value, equals(reference));
      });

      test('is false when Content changes', () async {
        var file = new EpubTextContentFileRef(testBookRef.value);
        file
          ..ContentMimeType = 'application/txt'
          ..ContentType = EpubContentType.OTHER
          ..FileName = 'orthros.txt';

        EpubContentRef content = new EpubContentRef();
        content.AllFiles['hello'] = file;

        testBookRef.value.Content = content;

        expect(testBookRef.value, isNot(reference));
      });

      test('is false when Author changes', () async {
        testBookRef.value.Author = 'NotOrthros';
        expect(testBookRef.value, isNot(reference));
      });

      test('is false when AuthorList changes', () async {
        testBookRef.value.AuthorList = ['NotOrthros'];
        expect(testBookRef.value, isNot(reference));
      });

      test('is false when Schema changes', () async {
        var schema = new EpubSchema();
        schema.ContentDirectoryPath = 'some/random/path';
        testBookRef.value.Schema = schema;
        expect(testBookRef.value, isNot(reference));
      });

      test('is false when Title changes', () async {
        testBookRef.value.Title = 'The Philosophy of Epubs';
        expect(testBookRef.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testBookRef.value.hashCode, equals(reference.hashCode));
      });

      test('is false when Content changes', () async {
        var file = new EpubTextContentFileRef(testBookRef.value);
        file
          ..ContentMimeType = 'application/txt'
          ..ContentType = EpubContentType.OTHER
          ..FileName = 'orthros.txt';

        EpubContentRef content = new EpubContentRef();
        content.AllFiles['hello'] = file;

        testBookRef.value.Content = content;

        expect(testBookRef.value, isNot(reference));
      });

      test('is false when Author changes', () async {
        testBookRef.value.Author = 'NotOrthros';
        expect(testBookRef.value.hashCode, isNot(reference.hashCode));
      });

      test('is false when AuthorList changes', () async {
        testBookRef.value.AuthorList = ['NotOrthros'];
        expect(testBookRef.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Schema changes', () async {
        var schema = new EpubSchema();
        schema.ContentDirectoryPath = 'some/random/path';
        testBookRef.value.Schema = schema;
        expect(testBookRef.value.hashCode, isNot(reference.hashCode));
      });

      test('is false when Title changes', () async {
        testBookRef.value.Title = 'The Philosophy of Epubs';
        expect(testBookRef.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
