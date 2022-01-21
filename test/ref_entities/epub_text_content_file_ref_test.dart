library epubreadertest;

import 'package:archive/archive.dart';
import 'package:epub/epub.dart';
import 'package:epub/src/ref_entities/epub_text_content_file_ref.dart';
import 'package:test/test.dart';
import '../obj_ref.dart';

main() async {
  var arch = new Archive();
  var epubRef = new EpubBookRef(arch);

  var reference = new EpubTextContentFileRef(epubRef);
  reference
    ..ContentMimeType = 'application/test'
    ..ContentType = EpubContentType.OTHER
    ..FileName = 'orthrosFile';
  var testFile = ObjRef<EpubTextContentFileRef>();

  setUp(() async {
    var arch2 = new Archive();
    var epubRef2 = new EpubBookRef(arch2);

    testFile.value = new EpubTextContentFileRef(epubRef2);
    testFile.value
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
