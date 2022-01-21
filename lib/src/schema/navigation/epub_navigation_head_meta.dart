

class EpubNavigationHeadMeta {
  String? Name;
  String? Content;
  String? Scheme;

  @override
  int get hashCode => Object.hash(Name, Content, Scheme);

  @override
  bool operator ==(Object? other) {
    return other is EpubNavigationHeadMeta &&
        Name == other.Name &&
        Content == other.Content &&
        Scheme == other.Scheme;
  }
}
