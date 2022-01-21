
import 'epub_navigation_doc_author.dart';
import 'epub_navigation_doc_title.dart';
import 'epub_navigation_head.dart';
import 'epub_navigation_list.dart';
import 'epub_navigation_map.dart';
import 'epub_navigation_page_list.dart';
import 'package:collection/collection.dart';

class EpubNavigation {
  EpubNavigationHead? Head;
  EpubNavigationDocTitle? DocTitle;
  List<EpubNavigationDocAuthor>? DocAuthors;
  EpubNavigationMap? NavMap;
  EpubNavigationPageList? PageList;
  List<EpubNavigationList>? NavLists;

  @override
  int get hashCode => Object.hash(
        Head,
        DocTitle,
        NavMap,
        PageList,
      ) ^ ListEquality().hash(DocAuthors) ^ ListEquality().hash(NavLists);

  @override
  bool operator ==(Object? other) {
    return other is EpubNavigation &&
        Head == other.Head &&
        DocTitle == other.DocTitle &&
        NavMap == other.NavMap &&
        PageList == other.PageList &&
        ListEquality().equals(DocAuthors, other.DocAuthors) &&
        ListEquality().equals(NavLists, other.NavLists)
    ;
  }
}
