import 'package:collection/collection.dart';

import 'epub_byte_content_file.dart';
import 'epub_content_file.dart';
import 'epub_text_content_file.dart';

class EpubContent {
  Map<String, EpubTextContentFile> Html = {};
  Map<String, EpubTextContentFile> Css = {};
  Map<String, EpubByteContentFile> Images = {};
  Map<String, EpubByteContentFile> Fonts = {};
  Map<String, EpubContentFile> AllFiles = {};

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
    return other is EpubContent
        && MapEquality().equals(Html, other.Html) &&
        MapEquality().equals(Css, other.Css) &&
        MapEquality().equals(Images, other.Images) &&
        MapEquality().equals(Fonts, other.Fonts) &&
        MapEquality().equals(AllFiles, other.AllFiles);
  }
}
