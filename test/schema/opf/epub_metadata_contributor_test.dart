library epubreadertest;

import 'package:epub/src/schema/opf/epub_metadata_contributor.dart';
import 'package:test/test.dart';
import '../../obj_ref.dart';

main() async {
  var reference = new EpubMetadataContributor()
    ..Contributor = 'orthros'
    ..FileAs = 'Large'
    ..Role = 'Creator';

  var testMetadataContributor = ObjRef<EpubMetadataContributor>();
  setUp(() async {
    testMetadataContributor.value = new EpubMetadataContributor()
      ..Contributor = reference.Contributor
      ..FileAs = reference.FileAs
      ..Role = reference.Role;
  });
  tearDown(() async {
    testMetadataContributor.value = null;
  });

  group('EpubMetadataContributor', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testMetadataContributor.value, equals(reference));
      });

      test('is false when Contributor changes', () async {
        testMetadataContributor.value.Contributor = 'NotOrthros';
        expect(testMetadataContributor.value, isNot(reference));
      });
      test('is false when FileAs changes', () async {
        testMetadataContributor.value.FileAs = 'Small';
        expect(testMetadataContributor.value, isNot(reference));
      });
      test('is false when Role changes', () async {
        testMetadataContributor.value.Role = 'Copier';
        expect(testMetadataContributor.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testMetadataContributor.value.hashCode, equals(reference.hashCode));
      });

      test('is false when Contributor changes', () async {
        testMetadataContributor.value.Contributor = 'NotOrthros';
        expect(testMetadataContributor.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when FileAs changes', () async {
        testMetadataContributor.value.FileAs = 'Small';
        expect(testMetadataContributor.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Role changes', () async {
        testMetadataContributor.value.Role = 'Copier';
        expect(testMetadataContributor.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
