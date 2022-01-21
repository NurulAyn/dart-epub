

import 'epub_guide.dart';
import 'epub_manifest.dart';
import 'epub_metadata.dart';
import 'epub_spine.dart';
import 'epub_version.dart';

class EpubPackage {
  EpubVersion? Version;
  EpubMetadata? Metadata;
  EpubManifest? Manifest;
  EpubSpine? Spine;
  EpubGuide? Guide;

  @override
  int get hashCode => Object.hash(
        Version,
        Metadata,
        Manifest,
        Spine,
        Guide
      );

  @override
  bool operator ==(Object? other) {
    return other is EpubPackage &&
      Version == other.Version &&
      Metadata == other.Metadata &&
      Manifest == other.Manifest &&
      Spine == other.Spine &&
      Guide == other.Guide;
  }
}
