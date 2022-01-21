import 'package:collection/collection.dart';

import 'epub_spine_item_ref.dart';

class EpubSpine {
  String? TableOfContents;
  List<EpubSpineItemRef>? Items;

  @override
  int get hashCode {
    return TableOfContents.hashCode ^ ListEquality().hash(Items);
  }

  @override
  bool operator ==(Object? other) {
    return other is EpubSpine &&
      TableOfContents == other.TableOfContents &&
      ListEquality().equals(Items, other.Items);
  }
}
