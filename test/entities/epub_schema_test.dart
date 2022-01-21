library epubreadertest;

import 'package:epub/epub.dart';
import 'package:epub/src/entities/epub_schema.dart';
import 'package:epub/src/schema/navigation/epub_navigation_doc_author.dart';
import 'package:epub/src/schema/navigation/epub_navigation_doc_title.dart';
import 'package:epub/src/schema/opf/epub_guide.dart';
import 'package:epub/src/schema/opf/epub_version.dart';
import 'package:test/test.dart';
import '../obj_ref.dart';

main() async {
  var reference = new EpubSchema();
  reference
    ..Package = new EpubPackage()
    ..Navigation = new EpubNavigation()
    ..ContentDirectoryPath = 'some/random/path';
  reference.Package!.Version = EpubVersion.Epub2;

  var testSchema = ObjRef<EpubSchema>();
  setUp(() async {
    testSchema.value = new EpubSchema();
    testSchema.value
      ..Package = reference.Package
      ..Navigation = reference.Navigation
      ..ContentDirectoryPath = reference.ContentDirectoryPath;
  });
  tearDown(() async {
    testSchema.value = null;
  });
  group('EpubSchema', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testSchema.value, equals(reference));
      });

      test('is false when Package changes', () async {
        var package = new EpubPackage()
          ..Guide = new EpubGuide()
          ..Version = EpubVersion.Epub3;

        testSchema.value.Package = package;
        expect(testSchema.value, isNot(reference));
      });

      test('is false when Navigation changes', () async {
        testSchema.value.Navigation = new EpubNavigation()
          ..DocTitle = new EpubNavigationDocTitle()
          ..DocAuthors = [new EpubNavigationDocAuthor()];

        expect(testSchema.value, isNot(reference));
      });

      test('is false when ContentDirectoryPath changes', () async {
        testSchema.value.ContentDirectoryPath = 'some/other/random/path/to/dev/null';
        expect(testSchema.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testSchema.value.hashCode, equals(reference.hashCode));
      });

      test('is false when Package changes', () async {
        var package = new EpubPackage()
          ..Guide = new EpubGuide()
          ..Version = EpubVersion.Epub3;

        testSchema.value.Package = package;
        expect(testSchema.value.hashCode, isNot(reference.hashCode));
      });

      test('is false when Navigation changes', () async {
        testSchema.value.Navigation = new EpubNavigation()
          ..DocTitle = new EpubNavigationDocTitle()
          ..DocAuthors = [new EpubNavigationDocAuthor()];

        expect(testSchema.value.hashCode, isNot(reference.hashCode));
      });

      test('is false when ContentDirectoryPath changes', () async {
        testSchema.value.ContentDirectoryPath = 'some/other/random/path/to/dev/null';
        expect(testSchema.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
