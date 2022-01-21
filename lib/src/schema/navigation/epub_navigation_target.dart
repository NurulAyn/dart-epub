import 'package:collection/collection.dart';

import 'epub_metadata.dart';
import 'epub_navigation_label.dart';

class EpubNavigationTarget {
  String? Id;
  String? Class;
  String? Value;
  String? PlayOrder;
  List<EpubNavigationLabel>? NavigationLabels;
  EpubNavigationContent? Content;

  @override
  int get hashCode {
    return Object.hash(Id, Class, Value, PlayOrder, Content) ^ ListEquality().hash(NavigationLabels);
  }

  @override
  bool operator ==(Object? other) {
    return other is EpubNavigationTarget &&
      Id == other.Id &&
      Class == other.Class &&
      Value == other.Value &&
      PlayOrder == other.PlayOrder &&
      ListEquality().equals(NavigationLabels, other.NavigationLabels) &&
      Content == other.Content;
  }
}
