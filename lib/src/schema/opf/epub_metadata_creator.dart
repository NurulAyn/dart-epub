

class EpubMetadataCreator {
  String? Creator;
  String? FileAs;
  String? Role;

  @override
  int get hashCode => Object.hash(Creator, FileAs, Role);

  @override
  bool operator ==(Object? other) {
    return other is EpubMetadataCreator &&
      Creator == other.Creator &&
      FileAs == other.FileAs &&
      Role == other.Role;
  }
}
