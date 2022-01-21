

class EpubMetadataMeta {
  String? Name;
  String? Content;
  String? Id;
  String? Refines;
  String? Property;
  String? Scheme;

  @override
  int get hashCode => Object.hash(
        Name,
        Content,
        Id,
        Refines,
        Property,
        Scheme
      );

  @override
  bool operator ==(Object? other) {
    return other is EpubMetadataMeta &&
      Name == other.Name &&
      Content == other.Content &&
      Id == other.Id &&
      Refines == other.Refines &&
      Property == other.Property &&
      Scheme == other.Scheme;
  }
}
