import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';
import 'package:flutter_docs/router.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  static const routeName = 'search';
  static const title = 'search';

  @override
  Widget build(BuildContext context) {
    return ListPageScaffold(
      title: title,
      sections: AppRouter.searchRoutes,
      isSearch: true,
    );
  }
}
