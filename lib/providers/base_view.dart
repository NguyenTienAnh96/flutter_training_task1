import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'base_provider.dart';
import 'loading_provider.dart';

abstract class BaseView<S extends StatefulWidget, T extends BaseProvider>
    extends State<S> with AutomaticKeepAliveClientMixin {
  T _provider;
  T initProvider();

  T get provider => _provider;

  @override
  void initState() {
    super.initState();
    this._provider = initProvider();
    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => provider.onReady());
  }

  @override
  void dispose() {
    super.dispose();
    // this._provider.dispose();
  }

  Widget body();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiProvider(
      providers: _provider.providers,
      child: Stack(
        children: [
          body(),
          buildLoading(),
        ],
      ),
    );
  }

  Widget buildLoading() {
    return Consumer<LoadingNotifier>(
      builder: (_, notifier, __) =>
          notifier.value ? _buildLoading() : SizedBox(),
    );
  }

  Widget _buildLoading() {
    return SizedBox();
  }

  @override
  bool get wantKeepAlive => true;
}
