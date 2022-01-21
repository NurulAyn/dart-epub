library epubreadertest;

import 'dart:math';

import 'package:epub/epub.dart';
import 'package:epub/src/schema/opf/epub_version.dart';
import 'package:test/test.dart';

import '../../random_data_generator.dart';
import '../../obj_ref.dart';

main() async {
  final int length = 10;

  final RandomDataGenerator generator =
      new RandomDataGenerator(new Random(123778), length);

  var reference = generator.randomEpubPackage()..Version = EpubVersion.Epub3;

  var testPackage = ObjRef<EpubPackage>();
  setUp(() async {
    testPackage.value = new EpubPackage()
      ..Guide = reference.Guide
      ..Manifest = reference.Manifest
      ..Metadata = reference.Metadata
      ..Spine = reference.Spine
      ..Version = reference.Version;
  });
  tearDown(() async {
    testPackage.value = null;
  });

  group('EpubSpine', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testPackage.value, equals(reference));
      });
      test('is false when Guide changes', () async {
        testPackage.value.Guide = generator.randomEpubGuide();
        expect(testPackage.value, isNot(reference));
      });
      test('is false when Manifest changes', () async {
        testPackage.value.Manifest = generator.randomEpubManifest();
        expect(testPackage.value, isNot(reference));
      });
      test('is false when Metadata changes', () async {
        testPackage.value.Metadata = generator.randomEpubMetadata();
        expect(testPackage.value, isNot(reference));
      });
      test('is false when Spine changes', () async {
        testPackage.value.Spine = generator.randomEpubSpine();
        expect(testPackage.value, isNot(reference));
      });
      test('is false when Version changes', () async {
        testPackage.value.Version = testPackage.value.Version == EpubVersion.Epub2
            ? EpubVersion.Epub3
            : EpubVersion.Epub2;
        expect(testPackage.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testPackage.value.hashCode, equals(reference.hashCode));
      });
      test('is false when Guide changes', () async {
        testPackage.value.Guide = generator.randomEpubGuide();
        expect(testPackage.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Manifest changes', () async {
        testPackage.value.Manifest = generator.randomEpubManifest();
        expect(testPackage.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Metadata changes', () async {
        testPackage.value.Metadata = generator.randomEpubMetadata();
        expect(testPackage.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Spine changes', () async {
        testPackage.value.Spine = generator.randomEpubSpine();
        expect(testPackage.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Version changes', () async {
        testPackage.value.Version = testPackage.value.Version == EpubVersion.Epub2
            ? EpubVersion.Epub3
            : EpubVersion.Epub2;
        expect(testPackage.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
