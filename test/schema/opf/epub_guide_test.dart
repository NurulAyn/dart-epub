library epubreadertest;

import 'dart:math' show Random;

import 'package:epub/src/schema/opf/epub_guide.dart';
import 'package:test/test.dart';

import '../../random_data_generator.dart';
import '../../obj_ref.dart';

main() async {
  RandomDataGenerator generator =
      new RandomDataGenerator(new Random(123445), 10);

  var reference = generator.randomEpubGuide();

  var testGuide = ObjRef<EpubGuide>();
  setUp(() async {
    testGuide.value = new EpubGuide()..Items = List.from(reference.Items);
  });
  tearDown(() async {
    testGuide.value = null;
  });
  group('EpubGuide', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testGuide.value, equals(reference));
      });
      test('is false when Items changes', () async {
        testGuide.value.Items.add(generator.randomEpubGuideReference());
        expect(testGuide.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testGuide.value.hashCode, equals(reference.hashCode));
      });
      test('is false when Items changes', () async {
        testGuide.value.Items.add(generator.randomEpubGuideReference());
        expect(testGuide.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
