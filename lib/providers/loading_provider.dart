import 'package:provider/provider.dart';

import 'base_notifier.dart';

class LoadingNotifier<bool> extends BaseNotifier {
  LoadingNotifier(value) : super(value);

  @override
  ListenableProvider provider() {
    return ChangeNotifierProvider<LoadingNotifier>(
      create: (context) => this,
    );
  }
}
