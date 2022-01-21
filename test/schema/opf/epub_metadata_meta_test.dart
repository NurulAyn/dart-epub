library epubreadertest;

import 'package:epub/src/schema/opf/epub_metadata_meta.dart';
import 'package:test/test.dart';
import '../../obj_ref.dart';

main() async {
  var reference = new EpubMetadataMeta()
    ..Content = 'some content'
    ..Name = 'Orthros'
    ..Property = 'Prop'
    ..Refines = 'Oil'
    ..Id = 'Unique'
    ..Scheme = 'A plot';

  var testMetadataMeta = ObjRef<EpubMetadataMeta>();
  setUp(() async {
    testMetadataMeta.value = new EpubMetadataMeta()
      ..Content = reference.Content
      ..Name = reference.Name
      ..Property = reference.Property
      ..Refines = reference.Refines
      ..Id = reference.Id
      ..Scheme = reference.Scheme;
  });
  tearDown(() async {
    testMetadataMeta.value = null;
  });

  group('EpubMetadataMeta', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testMetadataMeta.value, equals(reference));
      });

      test('is false when Refines changes', () async {
        testMetadataMeta.value.Refines = 'Natural gas';
        expect(testMetadataMeta.value, isNot(reference));
      });
      test('is false when Property changes', () async {
        testMetadataMeta.value.Property = 'A different Property';
        expect(testMetadataMeta.value, isNot(reference));
      });
      test('is false when Name changes', () async {
        testMetadataMeta.value.Id = 'notOrthros';
        expect(testMetadataMeta.value, isNot(reference));
      });
      test('is false when Content changes', () async {
        testMetadataMeta.value.Content = 'A different Content';
        expect(testMetadataMeta.value, isNot(reference));
      });
      test('is false when Id changes', () async {
        testMetadataMeta.value.Id = 'A different ID';
        expect(testMetadataMeta.value, isNot(reference));
      });
      test('is false when Scheme changes', () async {
        testMetadataMeta.value.Scheme = 'A strange scheme';
        expect(testMetadataMeta.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testMetadataMeta.value.hashCode, equals(reference.hashCode));
      });
      test('is false when Refines changes', () async {
        testMetadataMeta.value.Refines = 'Natural Gas';
        expect(testMetadataMeta.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Property changes', () async {
        testMetadataMeta.value.Property = 'A different property';
        expect(testMetadataMeta.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Name changes', () async {
        testMetadataMeta.value.Name = 'NotOrthros';
        expect(testMetadataMeta.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Content changes', () async {
        testMetadataMeta.value.Content = 'Different Content';
        expect(testMetadataMeta.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Id changes', () async {
        testMetadataMeta.value.Id = 'A different Id';
        expect(testMetadataMeta.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Scheme changes', () async {
        testMetadataMeta.value.Scheme = 'A strange scheme';
        expect(testMetadataMeta.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
