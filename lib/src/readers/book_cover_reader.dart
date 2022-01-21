import 'dart:async';

import 'package:image/image.dart' as images;

import '../ref_entities/epub_book_ref.dart';
import '../ref_entities/epub_byte_content_file_ref.dart';
import '../schema/opf/epub_manifest_item.dart';
import '../schema/opf/epub_metadata_meta.dart';
import '../utils/extensions.dart';

class BookCoverReader {
  static Future<images.Image?> readBookCover(EpubBookRef bookRef) async {
    var metaItems = bookRef.Schema?.Package?.Metadata?.MetaItems;
    if (metaItems == null || metaItems.isEmpty) return null;

    var coverMetaItem = metaItems.firstWhereNullable(
            (EpubMetadataMeta metaItem) =>
        metaItem.Name != null && metaItem.Name!.toLowerCase() == 'cover');

    if (coverMetaItem == null) return null;
    if (coverMetaItem.Content == null || coverMetaItem.Content!.isEmpty) {
      throw Exception(
          'Incorrect EPUB metadata: cover item content is missing.');
    }

    var coverManifestItem = bookRef.Schema?.Package?.Manifest?.Items
        .firstWhereNullable(
            (EpubManifestItem manifestItem) =>
        manifestItem.Id!.toLowerCase() ==
            coverMetaItem.Content!.toLowerCase());
    if (coverManifestItem == null) {
      throw Exception(
          'Incorrect EPUB manifest: item with ID = \'${coverMetaItem.Content}\' is missing.');
    }

    EpubByteContentFileRef coverImageContentFileRef;
    if (bookRef.Content?.Images.containsKey(coverManifestItem.Href!) == false) {
      throw Exception(
          'Incorrect EPUB manifest: item with href = \'${coverManifestItem.Href}\' is missing.');
    }

    coverImageContentFileRef = bookRef.Content!.Images[coverManifestItem.Href]!;
    var coverImageContent = await coverImageContentFileRef.readContentAsBytes();
    var retval = images.decodeImage(coverImageContent);
    return retval;
  }
}
