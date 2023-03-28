import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';
import 'package:flutter_docs/router.dart';

class DartUIScreen extends StatelessWidget {
  const DartUIScreen({super.key});

  static const routeName = 'dart-ui';
  static const title = 'dart:ui';

  @override
  Widget build(BuildContext context) {
    return ListPageScaffold(title: title, sections: AppRouter.dartUI);
  }
}
