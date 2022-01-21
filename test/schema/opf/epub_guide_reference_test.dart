library epubreadertest;

import 'dart:math';

import 'package:epub/src/schema/opf/epub_guide_reference.dart';
import 'package:test/test.dart';

import '../../random_data_generator.dart';
import '../../obj_ref.dart';

main() async {
  final RandomDataGenerator generator =
      new RandomDataGenerator(new Random(123778), 10);

  var reference = generator.randomEpubGuideReference();

  var testGuideReference = ObjRef<EpubGuideReference>();
  setUp(() async {
    testGuideReference.value = new EpubGuideReference();
    testGuideReference.value
      ..Href = reference.Href
      ..Title = reference.Title
      ..Type = reference.Type;
  });
  tearDown(() async {
    testGuideReference.value = null;
  });
  group('EpubGuideReference', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testGuideReference.value, equals(reference));
      });

      test('is false when Href changes', () async {
        testGuideReference.value.Href = 'A different href';

        expect(testGuideReference.value, isNot(reference));
      });

      test('is false when Title changes', () async {
        testGuideReference.value.Title = 'A different Title';
        expect(testGuideReference.value, isNot(reference));
      });

      test('is false when Type changes', () async {
        testGuideReference.value.Type = 'Some different type';
        expect(testGuideReference.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testGuideReference.value.hashCode, equals(reference.hashCode));
      });

      test('is false when Href changes', () async {
        testGuideReference.value.Href = 'A different href';

        expect(testGuideReference.value.hashCode, isNot(reference.hashCode));
      });

      test('is false when Title changes', () async {
        testGuideReference.value.Title = 'A different Title';
        expect(testGuideReference.value.hashCode, isNot(reference.hashCode));
      });

      test('is false when Type changes', () async {
        testGuideReference.value.Type = 'Some different type';
        expect(testGuideReference.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
