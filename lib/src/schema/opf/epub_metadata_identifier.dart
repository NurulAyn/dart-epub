

class EpubMetadataIdentifier {
  String? Id;
  String? Scheme;
  String? Identifier;

  @override
  int get hashCode => Object.hash(Id, Scheme, Identifier);

  @override
  bool operator ==(Object? other) {
    return other is EpubMetadataIdentifier &&
      Id == other.Id &&
      Scheme == other.Scheme &&
      Identifier == other.Identifier;
  }
}
