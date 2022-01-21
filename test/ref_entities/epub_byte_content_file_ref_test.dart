library epubreadertest;

import 'package:archive/archive.dart';
import 'package:epub/epub.dart';
import 'package:epub/src/ref_entities/epub_byte_content_file_ref.dart';
import 'package:test/test.dart';
import '../obj_ref.dart';

main() async {
  Archive arch = new Archive();
  EpubBookRef ref = new EpubBookRef(arch);

  var reference = new EpubByteContentFileRef(ref);
  reference
    ..ContentMimeType = 'application/test'
    ..ContentType = EpubContentType.OTHER
    ..FileName = 'orthrosFile';

  var testFileRef = ObjRef<EpubByteContentFileRef>();

  setUp(() async {
    Archive arch2 = new Archive();
    EpubBookRef ref2 = new EpubBookRef(arch2);

    testFileRef.value = new EpubByteContentFileRef(ref2);
    testFileRef.value
      ..ContentMimeType = reference.ContentMimeType
      ..ContentType = reference.ContentType
      ..FileName = reference.FileName;
  });

  tearDown(() async {
    testFileRef.value = null;
  });

  group('EpubByteContentFileRef', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testFileRef.value, equals(reference));
      });

      test('is false when ContentMimeType changes', () async {
        testFileRef.value.ContentMimeType = 'application/different';
        expect(testFileRef.value, isNot(reference));
      });

      test('is false when ContentType changes', () async {
        testFileRef.value.ContentType = EpubContentType.CSS;
        expect(testFileRef.value, isNot(reference));
      });

      test('is false when FileName changes', () async {
        testFileRef.value.FileName = 'a_different_file_name.txt';
        expect(testFileRef.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is the same for equivalent content', () async {
        expect(testFileRef.value.hashCode, equals(reference.hashCode));
      });

      test('changes when ContentMimeType changes', () async {
        testFileRef.value.ContentMimeType = 'application/orthros';
        expect(testFileRef.value.hashCode, isNot(reference.hashCode));
      });

      test('changes when ContentType changes', () async {
        testFileRef.value.ContentType = EpubContentType.CSS;
        expect(testFileRef.value.hashCode, isNot(reference.hashCode));
      });

      test('changes when FileName changes', () async {
        testFileRef.value.FileName = 'a_different_file_name';
        expect(testFileRef.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
