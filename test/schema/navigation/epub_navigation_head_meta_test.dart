library epubreadertest;

import 'dart:math';

import 'package:epub/src/schema/navigation/epub_navigation_head_meta.dart';
import 'package:test/test.dart';

import '../../random_data_generator.dart';
import '../../obj_ref.dart';

main() async {
  final generator = new RandomDataGenerator(new Random(7898), 10);
  final EpubNavigationHeadMeta reference = generator.randomNavigationHeadMeta();

  var testNavigationDocTitle = ObjRef<EpubNavigationHeadMeta>();
  setUp(() async {
    testNavigationDocTitle.value = new EpubNavigationHeadMeta()
      ..Content = reference.Content
      ..Name = reference.Name
      ..Scheme = reference.Scheme;
  });
  tearDown(() async {
    testNavigationDocTitle.value = null;
  });

  group('EpubNavigationHeadMeta', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testNavigationDocTitle.value, equals(reference));
      });

      test('is false when Content changes', () async {
        testNavigationDocTitle.value.Content = generator.randomString();
        expect(testNavigationDocTitle.value, isNot(reference));
      });
      test('is false when Name changes', () async {
        testNavigationDocTitle.value.Name = generator.randomString();
        expect(testNavigationDocTitle.value, isNot(reference));
      });
      test('is false when Scheme changes', () async {
        testNavigationDocTitle.value.Scheme = generator.randomString();
        expect(testNavigationDocTitle.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testNavigationDocTitle.value.hashCode, equals(reference.hashCode));
      });

      test('is false when Content changes', () async {
        testNavigationDocTitle.value.Content = generator.randomString();
        expect(testNavigationDocTitle.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Name changes', () async {
        testNavigationDocTitle.value.Name = generator.randomString();
        expect(testNavigationDocTitle.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Scheme changes', () async {
        testNavigationDocTitle.value.Scheme = generator.randomString();
        expect(testNavigationDocTitle.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
