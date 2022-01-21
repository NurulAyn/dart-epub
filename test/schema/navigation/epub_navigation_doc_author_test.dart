library epubreadertest;

import 'dart:math';

import 'package:epub/src/schema/navigation/epub_navigation_doc_author.dart';
import 'package:test/test.dart';

import '../../random_data_generator.dart';
import '../../obj_ref.dart';

main() async {
  final generator = new RandomDataGenerator(new Random(7898), 10);
  final EpubNavigationDocAuthor reference =
      generator.randomNavigationDocAuthor();

  var testNavigationDocAuthor = ObjRef<EpubNavigationDocAuthor>();
  setUp(() async {
    testNavigationDocAuthor.value = new EpubNavigationDocAuthor()
      ..Authors = List.from(reference.Authors);
  });
  tearDown(() async {
    testNavigationDocAuthor.value = null;
  });

  group('EpubNavigationDocAuthor', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testNavigationDocAuthor.value, equals(reference));
      });

      test('is false when Authors changes', () async {
        testNavigationDocAuthor.value.Authors.add(generator.randomString());
        expect(testNavigationDocAuthor.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testNavigationDocAuthor.value.hashCode, equals(reference.hashCode));
      });

      test('is false when Authors changes', () async {
        testNavigationDocAuthor.value.Authors.add(generator.randomString());
        expect(testNavigationDocAuthor.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
