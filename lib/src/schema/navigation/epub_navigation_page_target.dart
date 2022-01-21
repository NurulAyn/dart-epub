import 'package:collection/collection.dart';

import 'epub_metadata.dart';
import 'epub_navigation_label.dart';
import 'epub_navigation_page_target_type.dart';

class EpubNavigationPageTarget {
  String? Id;
  String? Value;
  EpubNavigationPageTargetType? Type;
  String? Class;
  String? PlayOrder;
  List<EpubNavigationLabel>? NavigationLabels;
  EpubNavigationContent? Content;

  @override
  int get hashCode => Object.hash(
        Id,
        Value,
        Type,
        Class,
        PlayOrder,
        Content
      ) ^ ListEquality().hash(NavigationLabels);

  @override
  bool operator ==(Object? other) {
    return other is EpubNavigationPageTarget &&
      Id == other.Id &&
      Value == other.Value &&
      Type == other.Type &&
      Class == other.Class &&
      ListEquality().equals(NavigationLabels, other.NavigationLabels) &&
      Content == other.Content;
  }
}
