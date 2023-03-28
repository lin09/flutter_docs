import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';
import 'package:flutter_docs/router.dart';

class PaintingsScreen extends StatelessWidget {
  const PaintingsScreen({super.key});

  static const routeName = 'painting';
  static const title = 'painting';

  @override
  Widget build(BuildContext context) {
    return ListPageScaffold(title: title, sections: AppRouter.painting);
  }
}
