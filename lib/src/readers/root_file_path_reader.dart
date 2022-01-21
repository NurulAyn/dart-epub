import 'dart:async';
import 'dart:convert';

import 'package:archive/archive.dart';
import 'package:xml/xml.dart' as xml;
import '../utils/extensions.dart';

class RootFilePathReader {
  static Future<String> getRootFilePath(Archive epubArchive) async {
    const EPUB_CONTAINER_FILE_PATH = 'META-INF/container.xml';

    var containerFileEntry = epubArchive.files.firstWhereNullable(
            (ArchiveFile file) => file.name == EPUB_CONTAINER_FILE_PATH);

    if (containerFileEntry == null) {
      throw Exception(
          'EPUB parsing error: $EPUB_CONTAINER_FILE_PATH file not found in archive.');
    }

    var containerDocument =
        xml.XmlDocument.parse(Utf8Codec().decode(containerFileEntry.content));

    var packageElementList = containerDocument
        .findAllElements('container',
            namespace: 'urn:oasis:names:tc:opendocument:xmlns:container');
    if (packageElementList.isEmpty) {
      throw Exception('EPUB parsing error: Invalid epub container');
    }

    var rootFileElement = packageElementList.first.descendants.firstWhereNullable(
            (xml.XmlNode testElem) =>
        (testElem is xml.XmlElement) && 'rootfile' == testElem.name.local);
    if (rootFileElement == null) {
      throw Exception('EPUB parsing error: Invalid epub container. No root file.');
    }

    return rootFileElement.getAttribute('full-path')!;
  }
}
