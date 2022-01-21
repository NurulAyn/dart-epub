
class EpubManifestItem {
  String? Id;
  String? Href;
  String? MediaType;
  String? RequiredNamespace;
  String? RequiredModules;
  String? Fallback;
  String? FallbackStyle;

  @override
  int get hashCode => Object.hash(
        Id,
        Href,
        MediaType,
        RequiredNamespace,
        RequiredModules,
        Fallback,
        FallbackStyle
      );

  @override
  bool operator ==(Object? other) {
    return other is EpubManifestItem &&
        Id == other.Id &&
        Href == other.Href &&
        MediaType == other.MediaType &&
        RequiredNamespace == other.RequiredNamespace &&
        RequiredModules == other.RequiredModules &&
        Fallback == other.Fallback &&
        FallbackStyle == other.FallbackStyle;
  }

  @override
  String toString() {
    return 'Id: $Id, Href = $Href, MediaType = $MediaType';
  }
}
