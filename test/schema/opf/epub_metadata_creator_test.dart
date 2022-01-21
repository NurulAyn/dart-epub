library epubreadertest;

import 'package:epub/src/schema/opf/epub_metadata_creator.dart';
import 'package:test/test.dart';
import '../../obj_ref.dart';

main() async {
  var reference = new EpubMetadataCreator()
    ..Creator = 'orthros'
    ..FileAs = 'Large'
    ..Role = 'Creator';

  var testMetadataCreator = ObjRef<EpubMetadataCreator>();
  setUp(() async {
    testMetadataCreator.value = new EpubMetadataCreator()
      ..Creator = reference.Creator
      ..FileAs = reference.FileAs
      ..Role = reference.Role;
  });
  tearDown(() async {
    testMetadataCreator.value = null;
  });

  group('EpubMetadataCreator', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testMetadataCreator.value, equals(reference));
      });

      test('is false when Creator changes', () async {
        testMetadataCreator.value.Creator = 'NotOrthros';
        expect(testMetadataCreator.value, isNot(reference));
      });
      test('is false when FileAs changes', () async {
        testMetadataCreator.value.FileAs = 'Small';
        expect(testMetadataCreator.value, isNot(reference));
      });
      test('is false when Role changes', () async {
        testMetadataCreator.value.Role = 'Copier';
        expect(testMetadataCreator.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testMetadataCreator.value.hashCode, equals(reference.hashCode));
      });

      test('is false when Creator changes', () async {
        testMetadataCreator.value.Creator = 'NotOrthros';
        expect(testMetadataCreator.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when FileAs changes', () async {
        testMetadataCreator.value.FileAs = 'Small';
        expect(testMetadataCreator.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Role changes', () async {
        testMetadataCreator.value.Role = 'Copier';
        expect(testMetadataCreator.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
