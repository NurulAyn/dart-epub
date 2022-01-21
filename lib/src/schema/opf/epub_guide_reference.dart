
class EpubGuideReference {
  String? Type;
  String? Title;
  String? Href;

  @override
  int get hashCode => Object.hash(Type, Title, Href);

  @override
  bool operator ==(Object? other) {
    return other is EpubGuideReference &&
        Type == other.Type &&
        Title == other.Title &&
        Href == other.Href;
  }

  @override
  String toString() {
    return 'Type: $Type, Href: $Href';
  }
}
