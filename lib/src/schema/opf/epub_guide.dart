import 'package:collection/collection.dart';

import 'epub_guide_reference.dart';

class EpubGuide {
  List<EpubGuideReference> Items = <EpubGuideReference>[];

  @override
  int get hashCode => ListEquality().hash(Items);

  @override
  bool operator ==(Object? other) {
    return other is EpubGuide &&
        ListEquality().equals(Items, other.Items);
  }
}
