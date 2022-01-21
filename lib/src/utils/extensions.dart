
extension IterableExtension<E> on Iterable<E> {
  E? firstWhereNullable(bool Function(E element) test, { E? Function()? orElse }) {
    E? value;
    try {
      value = firstWhere(test);
    } on Exception catch (e) {
      value = orElse != null ? orElse.call() : null;
    }

    return value;
  }

  E? get firstNullable {
    var it = iterator;
    if (!it.moveNext()) {
      return null;
    }
    return it.current;
  }
}