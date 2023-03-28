import 'package:flutter/cupertino.dart';

import 'cupertino.dart';
import 'widgets.dart';
import 'other.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // CupertinoApp 的路由导航
    var navigatorState = Navigator.of(context);

    var tabRoutes = <_TabRoute>[
      _TabRoute(
        icon: const Icon(CupertinoIcons.folder_solid),
        label: 'cupertino',
        path: 'cupertino',
        page: (context) => CupertinoScreen(navigatorState: navigatorState),
      ),
      _TabRoute(
        icon: const Icon(CupertinoIcons.folder_solid),
        label: 'widgets',
        path: 'widgets',
        page: (context) => WidgetsScreen(navigatorState: navigatorState),
      ),
      _TabRoute(
        icon: const Icon(CupertinoIcons.folder_solid),
        label: 'other',
        path: 'other',
        page: (context) => OtherScreen(navigatorState: navigatorState),
      ),
    ];

    var tabBarItems = [
      for (var item in tabRoutes)
        BottomNavigationBarItem(
          icon: item.icon,
          label: item.label,
        )
    ];

    var routes = {for (var item in tabRoutes) item.path: item.page};

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: tabBarItems,
        border: null,
      ),
      tabBuilder: (context, index) => CupertinoTabView(
        builder: routes.values.elementAt(index),
      ),
    );
  }
}

class _TabRoute {
  final Icon icon;
  final String label;
  final String path;
  final Widget Function(BuildContext) page;

  _TabRoute({
    required this.icon,
    required this.label,
    required this.path,
    required this.page,
  });
}
