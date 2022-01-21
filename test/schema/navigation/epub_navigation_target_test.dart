library epubreadertest;

import 'dart:math';

import 'package:epub/src/schema/navigation/epub_navigation_target.dart';
import 'package:test/test.dart';

import '../../random_data_generator.dart';
import '../../obj_ref.dart';

main() async {
  final RandomDataGenerator generator =
      new RandomDataGenerator(new Random(123778), 10);

  final EpubNavigationTarget reference = generator.randomEpubNavigationTarget();

  var testNavigationTarget = ObjRef<EpubNavigationTarget>();
  setUp(() async {
    testNavigationTarget.value = new EpubNavigationTarget()
      ..Class = reference.Class
      ..Content = reference.Content
      ..Id = reference.Id
      ..NavigationLabels = reference.NavigationLabels != null ? List.from(reference.NavigationLabels!) : null
      ..PlayOrder = reference.PlayOrder
      ..Value = reference.Value;
  });
  tearDown(() async {
    testNavigationTarget.value = null;
  });
  group('EpubNavigationTarget', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testNavigationTarget.value, equals(reference));
      });

      test('is false when Class changes', () async {
        testNavigationTarget.value.Class = generator.randomString();
        expect(testNavigationTarget.value, isNot(reference));
      });
      test('is false when Content changes', () async {
        testNavigationTarget.value.Content = generator.randomEpubNavigationContent();
        expect(testNavigationTarget.value, isNot(reference));
      });
      test('is false when Id changes', () async {
        testNavigationTarget.value.Id = generator.randomString();
        expect(testNavigationTarget.value, isNot(reference));
      });
      test('is false when NavigationLabels changes', () async {
        testNavigationTarget.value.NavigationLabels = [
          generator.randomEpubNavigationLabel()
        ];
        expect(testNavigationTarget.value, isNot(reference));
      });
      test('is false when PlayOrder changes', () async {
        testNavigationTarget.value.PlayOrder = generator.randomString();
        expect(testNavigationTarget.value, isNot(reference));
      });
      test('is false when Value changes', () async {
        testNavigationTarget.value.Value = generator.randomString();
        expect(testNavigationTarget.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testNavigationTarget.value.hashCode, equals(reference.hashCode));
      });

      test('is false when Class changes', () async {
        testNavigationTarget.value.Class = generator.randomString();
        expect(testNavigationTarget.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Content changes', () async {
        testNavigationTarget.value.Content = generator.randomEpubNavigationContent();
        expect(testNavigationTarget.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Id changes', () async {
        testNavigationTarget.value.Id = generator.randomString();
        expect(testNavigationTarget.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when NavigationLabels changes', () async {
        testNavigationTarget.value.NavigationLabels = [
          generator.randomEpubNavigationLabel()
        ];
        expect(testNavigationTarget.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when PlayOrder changes', () async {
        testNavigationTarget.value.PlayOrder = generator.randomString();
        expect(testNavigationTarget.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Value changes', () async {
        testNavigationTarget.value.Value = generator.randomString();
        expect(testNavigationTarget.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
