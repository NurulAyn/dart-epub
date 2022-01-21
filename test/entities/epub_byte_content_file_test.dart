library epubreadertest;

import 'package:epub/epub.dart';
import 'package:test/test.dart';
import '../obj_ref.dart';

main() async {
  var reference = new EpubByteContentFile();
  reference
    ..Content = [0, 1, 2, 3]
    ..ContentMimeType = 'application/test'
    ..ContentType = EpubContentType.OTHER
    ..FileName = 'orthrosFile';
  
  var testFile = ObjRef<EpubByteContentFile>();

  setUp(() async {
    testFile.value = new EpubByteContentFile();
    testFile.value
      ..Content = reference.Content
      ..ContentMimeType = reference.ContentMimeType
      ..ContentType = reference.ContentType
      ..FileName = reference.FileName;
  });

  tearDown(() async {
    testFile.value = null;
  });

  group('EpubByteContentFile', () {
    test('.equals is true for equivalent objects', () async {
      expect(testFile.value, equals(reference));
    });

    test('.equals is false when Content changes', () async {
      testFile.value.Content = [3, 2, 1, 0];
      expect(testFile.value, isNot(reference));
    });

    test('.equals is false when ContentMimeType changes', () async {
      testFile.value.ContentMimeType = 'application/different';
      expect(testFile.value, isNot(reference));
    });

    test('.equals is false when ContentType changes', () async {
      testFile.value.ContentType = EpubContentType.CSS;
      expect(testFile.value, isNot(reference));
    });

    test('.equals is false when FileName changes', () async {
      testFile.value.FileName = 'a_different_file_name.txt';
      expect(testFile.value, isNot(reference));
    });

    test('.hashCode is the same for equivalent content', () async {
      expect(testFile.value.hashCode, equals(reference.hashCode));
    });

    test('.hashCode changes when Content changes', () async {
      testFile.value.Content = [3, 2, 1, 0];
      expect(testFile.value.hashCode, isNot(reference.hashCode));
    });

    test('.hashCode changes when ContentMimeType changes', () async {
      testFile.value.ContentMimeType = 'application/orthros';
      expect(testFile.value.hashCode, isNot(reference.hashCode));
    });

    test('.hashCode changes when ContentType changes', () async {
      testFile.value.ContentType = EpubContentType.CSS;
      expect(testFile.value.hashCode, isNot(reference.hashCode));
    });

    test('.hashCode changes when FileName changes', () async {
      testFile.value.FileName = 'a_different_file_name';
      expect(testFile.value.hashCode, isNot(reference.hashCode));
    });
  });
}
