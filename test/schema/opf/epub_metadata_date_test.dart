library epubreadertest;

import 'package:epub/src/schema/opf/epub_metadata_date.dart';
import 'package:test/test.dart';
import '../../obj_ref.dart';

main() async {
  var reference = new EpubMetadataDate()
    ..Date = 'a date'
    ..Event = 'Some important event';

  var testMetadataDate = ObjRef<EpubMetadataDate>();
  setUp(() async {
    testMetadataDate.value = new EpubMetadataDate()
      ..Date = reference.Date
      ..Event = reference.Event;
  });
  tearDown(() async {
    testMetadataDate.value = null;
  });

  group('EpubMetadataIdentifier', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testMetadataDate.value, equals(reference));
      });

      test('is false when Date changes', () async {
        testMetadataDate.value.Date = 'A different Date';
        expect(testMetadataDate.value, isNot(reference));
      });
      test('is false when Event changes', () async {
        testMetadataDate.value.Event = 'A non important event';
        expect(testMetadataDate.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testMetadataDate.value.hashCode, equals(reference.hashCode));
      });

      test('is false when Date changes', () async {
        testMetadataDate.value.Date = 'A different date';
        expect(testMetadataDate.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Event changes', () async {
        testMetadataDate.value.Event = 'A non important event';
        expect(testMetadataDate.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
