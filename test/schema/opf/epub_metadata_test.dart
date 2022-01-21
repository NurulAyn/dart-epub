library epubreadertest;

import 'dart:math';

import 'package:epub/src/schema/opf/epub_metadata.dart';
import 'package:epub/src/schema/opf/epub_metadata_contributor.dart';
import 'package:epub/src/schema/opf/epub_metadata_creator.dart';
import 'package:epub/src/schema/opf/epub_metadata_date.dart';
import 'package:epub/src/schema/opf/epub_metadata_identifier.dart';
import 'package:epub/src/schema/opf/epub_metadata_meta.dart';
import 'package:test/test.dart';

import '../../random_data_generator.dart';
import '../../obj_ref.dart';

main() async {
  final int length = 10;
  final RandomString randomString = new RandomString(new Random(123788));
  final RandomDataGenerator generator =
      new RandomDataGenerator(new Random(123778), length);

  var reference = generator.randomEpubMetadata();
  var testMetadata = ObjRef<EpubMetadata>();
  setUp(() async {
    testMetadata.value = new EpubMetadata()
      ..Contributors = List.from(reference.Contributors!)
      ..Coverages = List.from(reference.Coverages!)
      ..Creators = List.from(reference.Creators!)
      ..Dates = List.from(reference.Dates!)
      ..Description = reference.Description
      ..Formats = List.from(reference.Formats!)
      ..Identifiers = List.from(reference.Identifiers!)
      ..Languages = List.from(reference.Languages!)
      ..MetaItems = List.from(reference.MetaItems!)
      ..Publishers = List.from(reference.Publishers!)
      ..Relations = List.from(reference.Relations!)
      ..Rights = List.from(reference.Rights!)
      ..Sources = List.from(reference.Sources!)
      ..Subjects = List.from(reference.Subjects!)
      ..Titles = List.from(reference.Titles!)
      ..Types = List.from(reference.Types!);
  });
  tearDown(() async {
    testMetadata.value = null;
  });

  group('EpubMetadata', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testMetadata.value, equals(reference));
      });
      test('is false when Contributors changes', () async {
        testMetadata.value.Contributors = [new EpubMetadataContributor()];
        expect(testMetadata.value, isNot(reference));
      });
      test('is false when Coverages changes', () async {
        testMetadata.value.Coverages = [randomString.randomAlpha(length)];
        expect(testMetadata.value, isNot(reference));
      });
      test('is false when Creators changes', () async {
        testMetadata.value.Creators = [new EpubMetadataCreator()];
        expect(testMetadata.value, isNot(reference));
      });
      test('is false when Dates changes', () async {
        testMetadata.value.Dates = [new EpubMetadataDate()];
        expect(testMetadata.value, isNot(reference));
      });
      test('is false when Description changes', () async {
        testMetadata.value.Description = randomString.randomAlpha(length);
        expect(testMetadata.value, isNot(reference));
      });
      test('is false when Formats changes', () async {
        testMetadata.value.Formats = [randomString.randomAlpha(length)];
        expect(testMetadata.value, isNot(reference));
      });
      test('is false when Identifiers changes', () async {
        testMetadata.value.Identifiers = [new EpubMetadataIdentifier()];
        expect(testMetadata.value, isNot(reference));
      });
      test('is false when Languages changes', () async {
        testMetadata.value.Languages = [randomString.randomAlpha(length)];
        expect(testMetadata.value, isNot(reference));
      });
      test('is false when MetaItems changes', () async {
        testMetadata.value.MetaItems = [new EpubMetadataMeta()];
        expect(testMetadata.value, isNot(reference));
      });
      test('is false when Publishers changes', () async {
        testMetadata.value.Publishers = [randomString.randomAlpha(length)];
        expect(testMetadata.value, isNot(reference));
      });
      test('is false when Relations changes', () async {
        testMetadata.value.Relations = [randomString.randomAlpha(length)];
        expect(testMetadata.value, isNot(reference));
      });
      test('is false when Rights changes', () async {
        testMetadata.value.Rights = [randomString.randomAlpha(length)];
        expect(testMetadata.value, isNot(reference));
      });
      test('is false when Sources changes', () async {
        testMetadata.value.Sources = [randomString.randomAlpha(length)];
        expect(testMetadata.value, isNot(reference));
      });
      test('is false when Subjects changes', () async {
        testMetadata.value.Subjects = [randomString.randomAlpha(length)];
        expect(testMetadata.value, isNot(reference));
      });
      test('is false when Titles changes', () async {
        testMetadata.value.Titles = [randomString.randomAlpha(length)];
        expect(testMetadata.value, isNot(reference));
      });
      test('is false when Types changes', () async {
        testMetadata.value.Types = [randomString.randomAlpha(length)];
        expect(testMetadata.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testMetadata.value.hashCode, equals(reference.hashCode));
      });
      test('is false when Contributors changes', () async {
        testMetadata.value.Contributors = [new EpubMetadataContributor()];
        expect(testMetadata.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Coverages changes', () async {
        testMetadata.value.Coverages = [randomString.randomAlpha(length)];
        expect(testMetadata.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Creators changes', () async {
        testMetadata.value.Creators = [new EpubMetadataCreator()];
        expect(testMetadata.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Dates changes', () async {
        testMetadata.value.Dates = [new EpubMetadataDate()];
        expect(testMetadata.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Description changes', () async {
        testMetadata.value.Description = randomString.randomAlpha(length);
        expect(testMetadata.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Formats changes', () async {
        testMetadata.value.Formats = [randomString.randomAlpha(length)];
        expect(testMetadata.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Identifiers changes', () async {
        testMetadata.value.Identifiers = [new EpubMetadataIdentifier()];
        expect(testMetadata.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Languages changes', () async {
        testMetadata.value.Languages = [randomString.randomAlpha(length)];
        expect(testMetadata.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when MetaItems changes', () async {
        testMetadata.value.MetaItems = [new EpubMetadataMeta()];
        expect(testMetadata.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Publishers changes', () async {
        testMetadata.value.Publishers = [randomString.randomAlpha(length)];
        expect(testMetadata.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Relations changes', () async {
        testMetadata.value.Relations = [randomString.randomAlpha(length)];
        expect(testMetadata.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Rights changes', () async {
        testMetadata.value.Rights = [randomString.randomAlpha(length)];
        expect(testMetadata.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Sources changes', () async {
        testMetadata.value.Sources = [randomString.randomAlpha(length)];
        expect(testMetadata.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Subjects changes', () async {
        testMetadata.value.Subjects = [randomString.randomAlpha(length)];
        expect(testMetadata.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Titles changes', () async {
        testMetadata.value.Titles = [randomString.randomAlpha(length)];
        expect(testMetadata.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Types changes', () async {
        testMetadata.value.Types = [randomString.randomAlpha(length)];
        expect(testMetadata.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
