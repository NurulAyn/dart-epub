library epubreadertest;

import 'package:epub/src/schema/opf/epub_manifest_item.dart';
import 'package:test/test.dart';
import '../../obj_ref.dart';

main() async {
  var reference = new EpubManifestItem()
    ..Fallback = 'Some Fallback'
    ..FallbackStyle = 'A Very Stylish Fallback'
    ..Href = 'Some HREF'
    ..Id = 'Some ID'
    ..MediaType = 'MKV'
    ..RequiredModules = 'nodejs require()'
    ..RequiredNamespace = '.NET Namespace';

  var testManifestItem = ObjRef<EpubManifestItem>();
  setUp(() async {
    testManifestItem.value = new EpubManifestItem()
      ..Fallback = reference.Fallback
      ..FallbackStyle = reference.FallbackStyle
      ..Href = reference.Href
      ..Id = reference.Id
      ..MediaType = reference.MediaType
      ..RequiredModules = reference.RequiredModules
      ..RequiredNamespace = reference.RequiredNamespace;
  });
  tearDown(() async {
    testManifestItem.value = null;
  });

  group('EpubManifestItem', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testManifestItem.value, equals(reference));
      });

      test('is false when Fallback changes', () async {
        testManifestItem.value.Fallback = 'Some Different Fallback';
        expect(testManifestItem.value, isNot(reference));
      });
      test('is false when FallbackStyle changes', () async {
        testManifestItem.value.FallbackStyle = 'A less than Stylish Fallback';
        expect(testManifestItem.value, isNot(reference));
      });
      test('is false when Href changes', () async {
        testManifestItem.value.Href = 'A different Href';
        expect(testManifestItem.value, isNot(reference));
      });
      test('is false when Id changes', () async {
        testManifestItem.value.Id = 'A guarenteed unique Id';
        expect(testManifestItem.value, isNot(reference));
      });
      test('is false when MediaType changes', () async {
        testManifestItem.value.MediaType = 'RealPlayer';
        expect(testManifestItem.value, isNot(reference));
      });
      test('is false when RequiredModules changes', () async {
        testManifestItem.value.RequiredModules = 'A non node-js module';
        expect(testManifestItem.value, isNot(reference));
      });
      test('is false when RequiredNamespaces changes', () async {
        testManifestItem.value.RequiredNamespace = 'Some non-dot net namespace';
        expect(testManifestItem.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testManifestItem.value.hashCode, equals(reference.hashCode));
      });

      test('is false when Fallback changes', () async {
        testManifestItem.value.Fallback = 'Some Different Fallback';
        expect(testManifestItem.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when FallbackStyle changes', () async {
        testManifestItem.value.FallbackStyle = 'A less than Stylish Fallback';
        expect(testManifestItem.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Href changes', () async {
        testManifestItem.value.Href = 'A different Href';
        expect(testManifestItem.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when Id changes', () async {
        testManifestItem.value.Id = 'A guarenteed unique Id';
        expect(testManifestItem.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when MediaType changes', () async {
        testManifestItem.value.MediaType = 'RealPlayer';
        expect(testManifestItem.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when RequiredModules changes', () async {
        testManifestItem.value.RequiredModules = 'A non node-js module';
        expect(testManifestItem.value.hashCode, isNot(reference.hashCode));
      });
      test('is false when RequiredNamespaces changes', () async {
        testManifestItem.value.RequiredNamespace = 'Some non-dot net namespace';
        expect(testManifestItem.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
