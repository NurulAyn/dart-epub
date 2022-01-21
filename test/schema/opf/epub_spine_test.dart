library epubreadertest;

import 'dart:math';

import 'package:epub/src/schema/opf/epub_spine.dart';
import 'package:epub/src/schema/opf/epub_spine_item_ref.dart';
import 'package:test/test.dart';

import '../../random_data_generator.dart';
import '../../obj_ref.dart';

main() async {
  final int length = 10;
  final RandomString randomString = new RandomString(new Random(123788));

  var reference = new EpubSpine()
    ..Items = [
      new EpubSpineItemRef()
        ..IdRef = randomString.randomAlpha(length)
        ..IdRef = randomString.randomAlpha(length)
    ]
    ..TableOfContents = randomString.randomAlpha(length);

  var testSpine = ObjRef<EpubSpine>();
  setUp(() async {
    testSpine.value = new EpubSpine()
      ..Items = List.from(reference.Items!)
      ..TableOfContents = reference.TableOfContents;
  });
  tearDown(() async {
    testSpine.value = null;
  });

  group('EpubSpine', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testSpine.value, equals(reference));
      });
      test('is false when Items changes', () async {
        testSpine.value.Items = [
          new EpubSpineItemRef()
            ..IdRef = randomString.randomAlpha(length)
            ..IsLinear = false
        ];
        expect(testSpine.value, isNot(reference));
      });
      test('is false when TableOfContents changes', () async {
        testSpine.value.TableOfContents = randomString.randomAlpha(length);
        expect(testSpine.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testSpine.value.hashCode, equals(reference.hashCode));
      });
      test('is false when IsLinear changes', () async {
        testSpine.value.Items = [
          new EpubSpineItemRef()
            ..IdRef = randomString.randomAlpha(length)
            ..IsLinear = false
        ];
        expect(testSpine.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when TableOfContents changes', () async {
        testSpine.value.TableOfContents = randomString.randomAlpha(length);
        expect(testSpine.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
