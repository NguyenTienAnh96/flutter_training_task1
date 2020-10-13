import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'base_notifier.dart';
import 'loading_provider.dart';

abstract class BaseProvider {
  final State _state;
  BaseProvider(this._state);

  State get state => _state;

  BuildContext get context => _state.context;

  List<BaseNotifier> initNotifiers();

  final LoadingNotifier _loadingNotifier = LoadingNotifier(false);

  List<ListenableProvider> get providers =>
      _notifiers.map<ListenableProvider>((e) => e.provider()).toList();

  List<BaseNotifier> get _notifiers =>
      ((initNotifiers() ?? [])..add(_loadingNotifier));

  void onReady() {
    print("postframecallback");
  }
}
