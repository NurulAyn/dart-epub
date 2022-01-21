class EpubNavigationLabel {
  String? Text;

  @override
  int get hashCode => Text.hashCode;

  @override
  bool operator ==(other) {
    return other is EpubNavigationLabel &&
        Text == other.Text;
  }

  @override
  String toString() {
    return Text ?? '';
  }
}
