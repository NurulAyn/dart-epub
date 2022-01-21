library epubreadertest;

import 'package:epub/src/schema/opf/epub_metadata_identifier.dart';
import 'package:test/test.dart';
import '../../obj_ref.dart';

main() async {
  var reference = new EpubMetadataIdentifier()
    ..Id = 'Unique'
    ..Identifier = 'Identifier'
    ..Scheme = 'A plot';

  var testMetadataIdentifier = ObjRef<EpubMetadataIdentifier>();
  setUp(() async {
    testMetadataIdentifier.value = new EpubMetadataIdentifier()
      ..Id = reference.Id
      ..Identifier = reference.Identifier
      ..Scheme = reference.Scheme;
  });
  tearDown(() async {
    testMetadataIdentifier.value = null;
  });

  group('EpubMetadataIdentifier', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testMetadataIdentifier.value, equals(reference));
      });

      test('is false when Id changes', () async {
        testMetadataIdentifier.value.Id = 'A different ID';
        expect(testMetadataIdentifier.value, isNot(reference));
      });
      test('is false when Identifier changes', () async {
        testMetadataIdentifier.value.Identifier = 'A different identifier';
        expect(testMetadataIdentifier.value, isNot(reference));
      });
      test('is false when Scheme changes', () async {
        testMetadataIdentifier.value.Scheme = 'A strange scheme';
        expect(testMetadataIdentifier.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testMetadataIdentifier.value.hashCode, equals(reference.hashCode));
      });

      test('is false when Id changes', () async {
        testMetadataIdentifier.value.Id = 'A different Id';
        expect(testMetadataIdentifier.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Identifier changes', () async {
        testMetadataIdentifier.value.Identifier = 'A different identifier';
        expect(testMetadataIdentifier.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Scheme changes', () async {
        testMetadataIdentifier.value.Scheme = 'A strange scheme';
        expect(testMetadataIdentifier.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
