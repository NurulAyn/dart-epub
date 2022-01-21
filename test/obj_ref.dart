
class ObjRef<T> {
  T? _value;
  void set value(T? v) {
    _value = v;
  }
  T get value => _value!;
}