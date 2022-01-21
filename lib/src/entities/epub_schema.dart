import '../schema/navigation/epub_navigation.dart';
import '../schema/opf/epub_package.dart';

class EpubSchema {
  EpubPackage? Package;
  EpubNavigation? Navigation;
  String? ContentDirectoryPath;

  @override
  int get hashCode => Object.hash(
      Package, Navigation, ContentDirectoryPath);

  @override
  bool operator ==(Object? other) {
    return other is EpubSchema &&
        Package == other.Package &&
        Navigation == other.Navigation &&
        ContentDirectoryPath == other.ContentDirectoryPath;
  }
}
