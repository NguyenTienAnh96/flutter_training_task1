import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class BaseNotifier<T> extends ChangeNotifier {
  T _value;
  BaseNotifier(T value) {
    this._value = value;
  }
  T get value => _value;
  set value(T value) {
    if (_value != value) {
      _value = value;
      notifyListeners();
    }
  }

  ListenableProvider provider();
}
