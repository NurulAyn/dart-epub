import 'package:collection/collection.dart';

import 'epub_metadata.dart';
import 'epub_navigation_label.dart';

class EpubNavigationPoint {
  String? Id;
  String? Class;
  String? PlayOrder;
  List<EpubNavigationLabel>? NavigationLabels;
  EpubNavigationContent? Content;
  List<EpubNavigationPoint>? ChildNavigationPoints;

  @override
  int get hashCode {
    return Object.hash(Id, Class, PlayOrder, Content)
      ^ ListEquality().hash(NavigationLabels)
      ^ ListEquality().hash(ChildNavigationPoints);
  }

  @override
  bool operator ==(Object? other) {
    return other is EpubNavigationPoint &&
      Id == other.Id &&
      PlayOrder == other.PlayOrder &&
      Class == other.Class &&
      ListEquality().equals(NavigationLabels, other.NavigationLabels) &&
      Content == other.Content &&
      ListEquality().equals(ChildNavigationPoints, other.ChildNavigationPoints)
        ;
  }

  @override
  String toString() {
    return 'Id: $Id, Content.Source: ${Content?.Source}';
  }
}
