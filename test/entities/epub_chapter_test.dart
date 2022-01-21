library epubreadertest;

import 'package:epub/epub.dart';
import 'package:test/test.dart';
import '../obj_ref.dart';

main() async {
  var reference = new EpubChapter();
  reference
    ..Anchor = 'anchor'
    ..ContentFileName = 'orthros'
    ..HtmlContent = '<html></html>'
    ..SubChapters = []
    ..Title = 'A New Look at Chapters';
  
  var testChapter = ObjRef<EpubChapter>();
  setUp(() async {
    testChapter.value = new EpubChapter();
    testChapter.value
      ..Anchor = reference.Anchor
      ..ContentFileName = reference.ContentFileName
      ..HtmlContent = reference.HtmlContent
      ..SubChapters = reference.SubChapters
      ..Title = reference.Title;
  });
  tearDown(() async {
    testChapter.value = null;
  });
  group('EpubChapter', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testChapter.value, equals(reference));
      });

      test('is false when HtmlContent changes', () async {
        testChapter.value.HtmlContent = '<html>I\'m sure this isn\'t valid Html</html>';
        expect(testChapter.value, isNot(reference));
      });

      test('is false when Anchor changes', () async {
        testChapter.value.Anchor = 'NotAnAnchor';
        expect(testChapter.value, isNot(reference));
      });

      test('is false when ContentFileName changes', () async {
        testChapter.value.ContentFileName = 'NotOrthros';
        expect(testChapter.value, isNot(reference));
      });

      test('is false when SubChapters changes', () async {
        var chapter = new EpubChapter();
        chapter
          ..Title = 'A Brave new Epub'
          ..ContentFileName = 'orthros.txt';
        testChapter.value.SubChapters = [chapter];
        expect(testChapter.value, isNot(reference));
      });

      test('is false when Title changes', () async {
        testChapter.value.Title = 'A Boring Old World';
        expect(testChapter.value, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testChapter.value.hashCode, equals(reference.hashCode));
      });

      test('is true for equivalent objects', () async {
        expect(testChapter.value.hashCode, equals(reference.hashCode));
      });

      test('is false when HtmlContent changes', () async {
        testChapter.value.HtmlContent = '<html>I\'m sure this isn\'t valid Html</html>';
        expect(testChapter.value.hashCode, isNot(reference.hashCode));
      });

      test('is false when Anchor changes', () async {
        testChapter.value.Anchor = 'NotAnAnchor';
        expect(testChapter.value.hashCode, isNot(reference.hashCode));
      });

      test('is false when ContentFileName changes', () async {
        testChapter.value.ContentFileName = 'NotOrthros';
        expect(testChapter.value.hashCode, isNot(reference.hashCode));
      });

      test('is false when SubChapters changes', () async {
        var chapter = new EpubChapter();
        chapter
          ..Title = 'A Brave new Epub'
          ..ContentFileName = 'orthros.txt';
        testChapter.value.SubChapters = [chapter];
        expect(testChapter.value.hashCode, isNot(reference.hashCode));
      });

      test('is false when Title changes', () async {
        testChapter.value.Title = 'A Boring Old World';
        expect(testChapter.value.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
