import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';
import 'package:flutter_docs/router.dart';

class AnimationsScreen extends StatelessWidget {
  const AnimationsScreen({super.key});

  static const routeName = 'animation';
  static const title = 'animation';

  @override
  Widget build(BuildContext context) {
    return ListPageScaffold(title: title, sections: AppRouter.animation);
  }
}
