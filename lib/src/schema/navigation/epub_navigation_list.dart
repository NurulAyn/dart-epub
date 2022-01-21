import 'package:collection/collection.dart';

import 'epub_navigation_label.dart';
import 'epub_navigation_target.dart';

class EpubNavigationList {
  String? Id;
  String? Class;
  List<EpubNavigationLabel>? NavigationLabels;
  List<EpubNavigationTarget>? NavigationTargets;

  @override
  int get hashCode => Object.hash(Id, Class)
    ^ ListEquality().hash(NavigationLabels)
    ^ ListEquality().hash(NavigationTargets);

  @override
  bool operator ==(Object? other) {
    return other is EpubNavigationList &&
      Id == other.Id &&
      Class == other.Class &&
      ListEquality().equals(NavigationLabels, other.NavigationLabels) &&
      ListEquality().equals(NavigationTargets, other.NavigationTargets);
  }
}
