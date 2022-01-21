library epubreadertest;

import 'package:archive/archive.dart';
import 'package:epub/epub.dart';
import 'package:epub/src/ref_entities/epub_byte_content_file_ref.dart';
import 'package:epub/src/ref_entities/epub_content_ref.dart';
import 'package:epub/src/ref_entities/epub_text_content_file_ref.dart';
import 'package:test/test.dart';
import '../obj_ref.dart';

main() async {
  var reference = new EpubContentRef();

  var testContent = ObjRef<EpubContentRef>();
  var textContentFile = ObjRef<EpubTextContentFileRef>();
  var byteContentFile = ObjRef<EpubByteContentFileRef>();

  setUp(() async {
    var arch = new Archive();
    var refBook = new EpubBookRef(arch);

    testContent.value = new EpubContentRef();

    textContentFile.value = new EpubTextContentFileRef(refBook)
      ..ContentMimeType = 'application/text'
      ..ContentType = EpubContentType.OTHER
      ..FileName = 'orthros.txt';

    byteContentFile.value = new EpubByteContentFileRef(refBook)
      ..ContentMimeType = 'application/orthros'
      ..ContentType = EpubContentType.OTHER
      ..FileName = 'orthros.bin';
  });

  tearDown(() async {
    testContent.value = null;
    textContentFile.value = null;
    byteContentFile.value = null;
  });
  group('EpubContentRef', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testContent.value, equals(reference));
      });

      test('is false when Html changes', () async {
        testContent.value.Html['someKey'] = textContentFile.value;
        expect(testContent.value, isNot(reference));
      });

      test('is false when Css changes', () async {
        testContent.value.Css['someKey'] = textContentFile.value;
        expect(testContent.value, isNot(reference));
      });

      test('is false when Images changes', () async {
        testContent.value.Images['someKey'] = byteContentFile.value;
        expect(testContent.value, isNot(reference));
      });

      test('is false when Fonts changes', () async {
        testContent.value.Fonts['someKey'] = byteContentFile.value;
        expect(testContent.value, isNot(reference));
      });

      test('is false when AllFiles changes', () async {
        testContent.value.AllFiles['someKey'] = byteContentFile.value;
        expect(testContent.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testContent.value.hashCode, equals(reference.hashCode));
      });

      test('is false when Html changes', () async {
        testContent.value.Html['someKey'] = textContentFile.value;
        expect(testContent.value.hashCode, isNot(reference.hashCode));
      });

      test('is false when Css changes', () async {
        testContent.value.Css['someKey'] = textContentFile.value;
        expect(testContent.value.hashCode, isNot(reference.hashCode));
      });

      test('is false when Images changes', () async {
        testContent.value.Images['someKey'] = byteContentFile.value;
        expect(testContent.value.hashCode, isNot(reference.hashCode));
      });

      test('is false when Fonts changes', () async {
        testContent.value.Fonts['someKey'] = byteContentFile.value;
        expect(testContent.value.hashCode, isNot(reference.hashCode));
      });

      test('is false when AllFiles changes', () async {
        testContent.value.AllFiles['someKey'] = byteContentFile.value;
        expect(testContent.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
