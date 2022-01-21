import 'package:collection/collection.dart';

class EpubNavigationDocTitle {
  List<String> Titles = <String>[];

  @override
  int get hashCode => ListEquality().hash(Titles);

  @override
  bool operator ==(Object? other) {
    return other is EpubNavigationDocTitle &&
        ListEquality().equals(Titles, other.Titles);
  }
}
