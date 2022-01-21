

class EpubSpineItemRef {
  String? IdRef;
  bool? IsLinear;

  @override
  int get hashCode => Object.hash(IdRef, IsLinear);

  @override
  bool operator ==(Object? other) {
    return other is EpubSpineItemRef &&
      IdRef == other.IdRef &&
      IsLinear == other.IsLinear;
  }

  @override
  String toString() {
    return 'IdRef: $IdRef';
  }
}
