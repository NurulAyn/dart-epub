library epubreadertest;

import 'package:epub/epub.dart';
import 'package:test/test.dart';
import '../obj_ref.dart';

main() async {
  var reference = new EpubContent();

  var testContent = ObjRef<EpubContent>();
  var textContentFile = ObjRef<EpubTextContentFile>();
  var byteContentFile = ObjRef<EpubByteContentFile>();

  setUp(() async {
    testContent.value = new EpubContent();

    textContentFile.value = new EpubTextContentFile();
    textContentFile.value
      ..Content = 'Some string'
      ..ContentMimeType = 'application/text'
      ..ContentType = EpubContentType.OTHER
      ..FileName = 'orthros.txt';

    byteContentFile.value = new EpubByteContentFile()
      ..Content = [0, 1, 2, 3]
      ..ContentMimeType = 'application/orthros'
      ..ContentType = EpubContentType.OTHER
      ..FileName = 'orthros.bin';
  });

  tearDown(() async {
    testContent.value = null;
    textContentFile.value = null;
    byteContentFile.value = null;
  });
  group('EpubContent', () {
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
