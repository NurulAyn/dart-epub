

class EpubNavigationContent {
  String? Id;
  String? Source;

  @override
  int get hashCode => Object.hash(Id, Source);

  @override
  bool operator ==(Object? other) {
    return other is EpubNavigationContent &&
        Id == other.Id &&
        Source == other.Source;
  }

  @override
  String toString() {
    return 'Source: $Source';
  }
}
