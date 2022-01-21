import 'package:collection/collection.dart';

import 'epub_manifest_item.dart';

class EpubManifest {
  List<EpubManifestItem> Items = <EpubManifestItem>[];

  @override
  int get hashCode => ListEquality().hash(Items);

  @override
  bool operator ==(Object? other) {
    return other is EpubManifest &&
        ListEquality().equals(Items, other.Items);
  }
}
