import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';
import 'package:flutter_docs/router.dart';

class CupertinoScreen extends StatelessWidget {
  const CupertinoScreen({super.key, required this.navigatorState});

  static const routeName = 'cupertino';
  static const title = 'Cupertino: IOS 设计风格';

  final NavigatorState navigatorState;

  @override
  Widget build(BuildContext context) {
    return ListPageScaffold(
      title: title,
      sections: AppRouter.cupertino,
      navigatorState: navigatorState,
    );
  }
}
