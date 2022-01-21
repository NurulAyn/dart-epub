import 'package:collection/collection.dart';

import 'epub_navigation_page_target.dart';

class EpubNavigationPageList {
  List<EpubNavigationPageTarget>? Targets;

  @override
  int get hashCode => ListEquality().hash(Targets);

  @override
  bool operator ==(Object? other) {
    return other is EpubNavigationPageList &&
      ListEquality().equals(Targets, other.Targets);
  }
}
