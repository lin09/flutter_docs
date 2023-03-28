import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';
import 'package:flutter_docs/router.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({super.key, required this.navigatorState});

  static const routeName = 'other';
  static const title = 'other';

  final NavigatorState navigatorState;

  @override
  Widget build(BuildContext context) {
    return ListPageScaffold(
      title: title,
      sections: AppRouter.other,
      navigatorState: navigatorState,
    );
  }
}
