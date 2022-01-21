import 'package:collection/collection.dart';

import 'epub_navigation_head_meta.dart';

class EpubNavigationHead {
  List<EpubNavigationHeadMeta> Metadata = <EpubNavigationHeadMeta>[];


  @override
  int get hashCode => ListEquality().hash(Metadata);

  @override
  bool operator ==(Object? other) {
    return other is EpubNavigationHead &&
        ListEquality().equals(Metadata, other.Metadata);
  }
}
