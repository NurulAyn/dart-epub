
class EpubMetadataContributor {
  String? Contributor;
  String? FileAs;
  String? Role;

  @override
  int get hashCode =>
      Object.hash(Contributor, FileAs, Role);

  @override
  bool operator ==(Object? other) {
    return other is EpubMetadataContributor &&
      Contributor == other.Contributor &&
      FileAs == other.FileAs &&
      Role == other.Role;
  }
}
