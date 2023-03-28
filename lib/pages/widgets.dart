import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';
import 'package:flutter_docs/router.dart';

class WidgetsScreen extends StatelessWidget {
  const WidgetsScreen({super.key, required this.navigatorState});

  static const routeName = 'widgets';
  static const title = 'widgets';

  final NavigatorState navigatorState;

  @override
  Widget build(BuildContext context) {
    return ListPageScaffold(
      title: title,
      sections: AppRouter.widgets,
      navigatorState: navigatorState,
    );
  }
}
