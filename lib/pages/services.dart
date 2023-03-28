import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';
import 'package:flutter_docs/router.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  static const routeName = 'services';
  static const title = 'services';

  @override
  Widget build(BuildContext context) {
    return ListPageScaffold(title: title, sections: AppRouter.services);
  }
}
