import 'package:collection/collection.dart';

import 'epub_metadata_contributor.dart';
import 'epub_metadata_creator.dart';
import 'epub_metadata_date.dart';
import 'epub_metadata_identifier.dart';
import 'epub_metadata_meta.dart';

class EpubMetadata {
  List<String>? Titles;
  List<EpubMetadataCreator>? Creators;
  List<String>? Subjects;
  String? Description;
  List<String>? Publishers;
  List<EpubMetadataContributor>? Contributors;
  List<EpubMetadataDate>? Dates;
  List<String>? Types;
  List<String>? Formats;
  List<EpubMetadataIdentifier>? Identifiers;
  List<String>? Sources;
  List<String>? Languages;
  List<String>? Relations;
  List<String>? Coverages;
  List<String>? Rights;
  List<EpubMetadataMeta>? MetaItems;

  @override
  int get hashCode {
    return ListEquality().hash(Titles)
      ^ ListEquality().hash(Creators)
      ^ ListEquality().hash(Subjects)
      ^ Description.hashCode
      ^ ListEquality().hash(Publishers)
      ^ ListEquality().hash(Contributors)
      ^ ListEquality().hash(Dates)
      ^ ListEquality().hash(Types)
      ^ ListEquality().hash(Formats)
      ^ ListEquality().hash(Identifiers)
      ^ ListEquality().hash(Sources)
      ^ ListEquality().hash(Languages)
      ^ ListEquality().hash(Relations)
      ^ ListEquality().hash(Coverages)
      ^ ListEquality().hash(Rights)
      ^ ListEquality().hash(MetaItems)
    ;
  }

  @override
  bool operator ==(Object? other) {
    return other is EpubMetadata &&
      ListEquality().equals(Titles, other.Titles) &&
        ListEquality().equals(Creators, other.Creators) &&
        ListEquality().equals(Subjects, other.Subjects) &&
        Description == other.Description &&
        ListEquality().equals(Publishers, other.Publishers) &&
        ListEquality().equals(Contributors, other.Contributors) &&
        ListEquality().equals(Dates, other.Dates) &&
        ListEquality().equals(Types, other.Types) &&
        ListEquality().equals(Formats, other.Formats) &&
        ListEquality().equals(Identifiers, other.Identifiers) &&
        ListEquality().equals(Sources, other.Sources) &&
        ListEquality().equals(Languages, other.Languages) &&
        ListEquality().equals(Relations, other.Relations) &&
        ListEquality().equals(Coverages, other.Coverages) &&
        ListEquality().equals(Rights, other.Rights) &&
        ListEquality().equals(MetaItems, other.MetaItems);
  }
}
