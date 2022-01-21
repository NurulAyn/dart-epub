library epubreadertest;

import 'package:epub/epub.dart';
import 'package:test/test.dart';
import '../obj_ref.dart';

main() async {
  var reference = new EpubTextContentFile();
  reference
    ..Content = 'Hello'
    ..ContentMimeType = 'application/test'
    ..ContentType = EpubContentType.OTHER
    ..FileName = 'orthrosFile';

  var testFile = ObjRef<EpubTextContentFile>();
  setUp(() async {
    testFile.value = EpubTextContentFile();
    testFile.value
      ..Content = reference.Content
      ..ContentMimeType = reference.ContentMimeType
      ..ContentType = reference.ContentType
      ..FileName = reference.FileName;
  });
  tearDown(() async {
    testFile.value = null;
  });
  group('EpubTextContentFile', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testFile.value, equals(reference));
      });

      test('is false when Content changes', () async {
        testFile.value.Content = 'Goodbye';
        expect(testFile.value, isNot(reference));
      });

      test('is false when ContentMimeType changes', () async {
        testFile.value.ContentMimeType = 'application/different';
        expect(testFile.value, isNot(reference));
      });

      test('is false when ContentType changes', () async {
        testFile.value.ContentType = EpubContentType.CSS;
        expect(testFile.value, isNot(reference));
      });

      test('is false when FileName changes', () async {
        testFile.value.FileName = 'a_different_file_name.txt';
        expect(testFile.value, isNot(reference));
      });
    });
    group('.hashCode', () {
      test('is the same for equivalent content', () async {
        expect(testFile.value.hashCode, equals(reference.hashCode));
      });

      test('changes when Content changes', () async {
        testFile.value.Content = 'Goodbye';
        expect(testFile.value.hashCode, isNot(reference.hashCode));
      });

      test('changes when ContentMimeType changes', () async {
        testFile.value.ContentMimeType = 'application/orthros';
        expect(testFile.value.hashCode, isNot(reference.hashCode));
      });

      test('changes when ContentType changes', () async {
        testFile.value.ContentType = EpubContentType.CSS;
        expect(testFile.value.hashCode, isNot(reference.hashCode));
      });

      test('changes when FileName changes', () async {
        testFile.value.FileName = 'a_different_file_name';
        expect(testFile.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
