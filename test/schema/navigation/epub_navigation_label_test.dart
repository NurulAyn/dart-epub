library epubreadertest;

import 'dart:math';

import 'package:epub/src/schema/navigation/epub_navigation_label.dart';
import 'package:test/test.dart';

import '../../random_data_generator.dart';
import '../../obj_ref.dart';

main() async {
  final RandomDataGenerator generator =
      new RandomDataGenerator(new Random(123778), 10);

  final EpubNavigationLabel reference = generator.randomEpubNavigationLabel();

  var testNavigationLabel = ObjRef<EpubNavigationLabel>();
  setUp(() async {
    testNavigationLabel.value = new EpubNavigationLabel()..Text = reference.Text;
  });
  tearDown(() async {
    testNavigationLabel.value = null;
  });
  group('EpubNavigationLabel', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testNavigationLabel.value, equals(reference));
      });

      test('is false when Text changes', () async {
        testNavigationLabel.value.Text = generator.randomString();
        expect(testNavigationLabel.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testNavigationLabel.value.hashCode, equals(reference.hashCode));
      });

      test('is false when Metadata changes', () async {
        testNavigationLabel.value.Text = generator.randomString();
        expect(testNavigationLabel.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
