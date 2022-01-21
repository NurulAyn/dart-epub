import 'extensions.dart';

class EnumFromString<T> {
  List<T> enumValues;

  EnumFromString(this.enumValues);

  T? get(String value) {
    value = '$T.$value';
    return enumValues
        .firstWhereNullable((f) => f.toString().toUpperCase() == value.toUpperCase());
  }
}
