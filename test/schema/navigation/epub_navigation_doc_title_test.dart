library epubreadertest;

import 'dart:math';

import 'package:epub/src/schema/navigation/epub_navigation_doc_title.dart';
import 'package:test/test.dart';

import '../../random_data_generator.dart';
import '../../obj_ref.dart';

main() async {
  final generator = new RandomDataGenerator(new Random(7898), 10);
  final EpubNavigationDocTitle reference = generator.randomNavigationDocTitle();

  var testNavigationDocTitle = ObjRef<EpubNavigationDocTitle>();
  setUp(() async {
    testNavigationDocTitle.value = new EpubNavigationDocTitle()
      ..Titles = List.from(reference.Titles);
  });
  tearDown(() async {
    testNavigationDocTitle.value = null;
  });

  group('EpubNavigationDocTitle', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testNavigationDocTitle.value, equals(reference));
      });

      test('is false when Titles changes', () async {
        testNavigationDocTitle.value.Titles.add(generator.randomString());
        expect(testNavigationDocTitle.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testNavigationDocTitle.value.hashCode, equals(reference.hashCode));
      });

      test('is false when Titles changes', () async {
        testNavigationDocTitle.value.Titles.add(generator.randomString());
        expect(testNavigationDocTitle.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
