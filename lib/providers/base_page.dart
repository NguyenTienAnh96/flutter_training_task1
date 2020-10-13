import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_provider.dart';
import 'base_view.dart';

abstract class BasePage<S extends StatefulWidget, T extends BaseProvider>
    extends BaseView<S, T> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiProvider(
      providers: provider.providers,
      child: Stack(
        children: [
          buildBackground(),
          Scaffold(appBar: buildAppbar(), body: body(),bottomNavigationBar: buildBottomNavigationBar(),),
          buildLoading()
        ],
      ),
    );
  }

  Widget buildBottomNavigationBar() => null;

  Widget buildAppbar() => null;

  Widget buildBackground() => Container(
        color: Colors.white,
      );
}
