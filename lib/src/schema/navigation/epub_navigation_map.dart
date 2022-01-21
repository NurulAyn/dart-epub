import 'package:collection/collection.dart';

import 'epub_navigation_point.dart';

class EpubNavigationMap {
  List<EpubNavigationPoint>? Points;

  @override
  int get hashCode => ListEquality().hash(Points);

  @override
  bool operator ==(Object? other) {
    return other is EpubNavigationMap &&
      ListEquality().equals(Points, other.Points);
  }
}
