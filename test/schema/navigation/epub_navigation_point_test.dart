library epubreadertest;

import 'dart:math';

import 'package:epub/src/schema/navigation/epub_navigation_point.dart';
import 'package:test/test.dart';

import '../../random_data_generator.dart';
import '../../obj_ref.dart';

main() async {
  final generator = new RandomDataGenerator(new Random(7898), 10);
  final EpubNavigationPoint reference = generator.randomEpubNavigationPoint(1);

  var testNavigationPoint = ObjRef<EpubNavigationPoint>();
  setUp(() async {
    testNavigationPoint.value = new EpubNavigationPoint()
      ..ChildNavigationPoints = List.from(reference.ChildNavigationPoints!)
      ..Class = reference.Class
      ..Content = reference.Content
      ..Id = reference.Id
      ..NavigationLabels = List.from(reference.NavigationLabels!)
      ..PlayOrder = reference.PlayOrder;
  });
  tearDown(() async {
    testNavigationPoint.value = null;
  });

  group('EpubNavigationPoint', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testNavigationPoint.value, equals(reference));
      });

      test('is false when ChildNavigationPoints changes', () async {
        testNavigationPoint.value.ChildNavigationPoints!.add(
            generator.randomEpubNavigationPoint());
        expect(testNavigationPoint.value, isNot(reference));
      });
      test('is false when Class changes', () async {
        testNavigationPoint.value.Class = generator.randomString();
        expect(testNavigationPoint.value, isNot(reference));
      });
      test('is false when Content changes', () async {
        testNavigationPoint.value.Content = generator.randomEpubNavigationContent();
        expect(testNavigationPoint.value, isNot(reference));
      });
      test('is false when Id changes', () async {
        testNavigationPoint.value.Id = generator.randomString();
        expect(testNavigationPoint.value, isNot(reference));
      });
      test('is false when PlayOrder changes', () async {
        testNavigationPoint.value.PlayOrder = generator.randomString();
        expect(testNavigationPoint.value, isNot(reference));
      });
      test('is false when NavigationLabels changes', () async {
        testNavigationPoint.value.NavigationLabels!.add(
            generator.randomEpubNavigationLabel());
        expect(testNavigationPoint.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testNavigationPoint.value.hashCode, equals(reference.hashCode));
      });

      test('is false when ChildNavigationPoints changes', () async {
        testNavigationPoint.value.ChildNavigationPoints!.add(
            generator.randomEpubNavigationPoint());
        expect(testNavigationPoint.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Class changes', () async {
        testNavigationPoint.value.Class = generator.randomString();
        expect(testNavigationPoint.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Content changes', () async {
        testNavigationPoint.value.Content = generator.randomEpubNavigationContent();
        expect(testNavigationPoint.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Id changes', () async {
        testNavigationPoint.value.Id = generator.randomString();
        expect(testNavigationPoint.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when PlayOrder changes', () async {
        testNavigationPoint.value.PlayOrder = generator.randomString();
        expect(testNavigationPoint.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when NavigationLabels changes', () async {
        testNavigationPoint.value.NavigationLabels!.add(
            generator.randomEpubNavigationLabel());
        expect(testNavigationPoint.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
