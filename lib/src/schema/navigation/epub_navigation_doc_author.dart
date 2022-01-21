import 'package:collection/collection.dart';

class EpubNavigationDocAuthor {
  List<String> Authors = <String>[];

  @override
  int get hashCode => ListEquality().hash(Authors);

  @override
  bool operator ==(Object? other) {
    return other is EpubNavigationDocAuthor &&
      ListEquality().equals(Authors, other.Authors);
  }
}
