import 'package:collection/collection.dart';

import 'epub_byte_content_file_ref.dart';
import 'epub_content_file_ref.dart';
import 'epub_text_content_file_ref.dart';

class EpubContentRef {
  Map<String, EpubTextContentFileRef> Html = {};
  Map<String, EpubTextContentFileRef> Css = {};
  Map<String, EpubByteContentFileRef> Images = {};
  Map<String, EpubByteContentFileRef> Fonts = {};
  Map<String, EpubContentFileRef> AllFiles = {};

  @override
  int get hashCode {
    return MapEquality().hash(Html)
    ^ MapEquality().hash(Css)
    ^ MapEquality().hash(Images)
    ^ MapEquality().hash(Fonts)
    ^ MapEquality().hash(AllFiles);
  }

  @override
  bool operator ==(Object? other) {
    return other is EpubContentRef
        && MapEquality().equals(Html, other.Html) &&
        MapEquality().equals(Css, other.Css) &&
        MapEquality().equals(Images, other.Images) &&
        MapEquality().equals(Fonts, other.Fonts) &&
        MapEquality().equals(AllFiles, other.AllFiles);
  }
}
