library epubreadertest;

import 'dart:math';

import 'package:epub/src/schema/navigation/epub_navigation_head.dart';
import 'package:test/test.dart';

import '../../random_data_generator.dart';
import '../../obj_ref.dart';

main() async {
  final RandomDataGenerator generator =
      new RandomDataGenerator(new Random(123778), 10);

  final EpubNavigationHead reference = generator.randomEpubNavigationHead();

  var testGuideReference = ObjRef<EpubNavigationHead>();
  setUp(() async {
    testGuideReference.value = new EpubNavigationHead()
      ..Metadata = List.from(reference.Metadata);
  });
  tearDown(() async {
    testGuideReference.value = null;
  });
  group('EpubNavigationHead', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testGuideReference.value, equals(reference));
      });

      test('is false when Metadata changes', () async {
        testGuideReference.value.Metadata.add(generator.randomNavigationHeadMeta());
        expect(testGuideReference.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testGuideReference.value.hashCode, equals(reference.hashCode));
      });

      test('is false when Metadata changes', () async {
        testGuideReference.value.Metadata.add(generator.randomNavigationHeadMeta());
        expect(testGuideReference.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
