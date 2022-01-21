library epubreadertest;

import 'package:epub/src/schema/opf/epub_manifest.dart';
import 'package:epub/src/schema/opf/epub_manifest_item.dart';
import 'package:test/test.dart';
import '../../obj_ref.dart';

main() async {
  var reference = new EpubManifest();
  reference.Items = [
    new EpubManifestItem()
      ..Fallback = 'Some Fallback'
      ..FallbackStyle = 'A Very Stylish Fallback'
      ..Href = 'Some HREF'
      ..Id = 'Some ID'
      ..MediaType = 'MKV'
      ..RequiredModules = 'nodejs require()'
      ..RequiredNamespace = '.NET Namespace'
  ];

  var testManifest = ObjRef<EpubManifest>();
  setUp(() async {
    testManifest.value = new EpubManifest()..Items = List.from(reference.Items);
  });
  tearDown(() async {
    testManifest.value = null;
  });
  group('EpubManifest', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testManifest.value, equals(reference));
      });

      test('is false when Items changes', () async {
        testManifest.value.Items.add(new EpubManifestItem()
          ..Fallback = 'Some Different Fallback'
          ..FallbackStyle = 'A less than Stylish Fallback'
          ..Href = 'Some Different HREF'
          ..Id = 'Some Different ID'
          ..MediaType = 'RealPlayer'
          ..RequiredModules = 'require()'
          ..RequiredNamespace = 'Namespace');

        expect(testManifest.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testManifest.value.hashCode, equals(reference.hashCode));
      });

      test('is false when Items changes', () async {
        testManifest.value.Items.add(new EpubManifestItem()
          ..Fallback = 'Some Different Fallback'
          ..FallbackStyle = 'A less than Stylish Fallback'
          ..Href = 'Some Different HREF'
          ..Id = 'Some Different ID'
          ..MediaType = 'RealPlayer'
          ..RequiredModules = 'require()'
          ..RequiredNamespace = 'Namespace');
        expect(testManifest.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
