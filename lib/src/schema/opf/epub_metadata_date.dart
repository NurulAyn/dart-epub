

class EpubMetadataDate {
  String? Date;
  String? Event;

  @override
  int get hashCode => Object.hash(Date, Event);

  @override
  bool operator ==(Object? other) {
    return other is EpubMetadataDate &&
      Date == other.Date &&
      Event == other.Event;
  }
}
