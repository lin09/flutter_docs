import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  // AlwaysScrollableScrollPhysics({ScrollPhysics? parent})

  ...
  CustomScrollView(
    physics: const AlwaysScrollableScrollPhysics(),
  ),
  ...
''';

class AlwaysScrollableScrollPhysicsScreen extends StatelessWidget {
  const AlwaysScrollableScrollPhysicsScreen({super.key});

  static const routeName = 'widgets/AlwaysScrollableScrollPhysics';
  static const title = 'AlwaysScrollableScrollPhysics';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: 'AlwaysScrollableScrollPhysics 是一种滚动行为，始终可滚动，滚动超'
          '出边界有拖拽效果（IOS回弹效果，安卓发光效果）。可运用到各种滚动部件中。',
      code: _code,
      parameters: [
        ListTile(
          name: 'parent',
          description: '默认滚动行为',
          type: 'ScrollPhysics',
        ),
      ],
      inheritance: ScrollPhysicsScreen.routeName,
      methods: [
        ListTile(
          name:
              'applyTo(ScrollPhysics? ancestor) → AlwaysScrollableScrollPhysics',
        ),
        ListTile(
          name: 'shouldAcceptUserOffset(ScrollMetrics position) → bool',
        ),
      ],
      seeAlso: [
        ListTile(
          description: '默认滚动',
          routeName: ScrollPhysicsScreen.routeName,
        ),
        ListTile(
          description: '内容超出时才有滚动，滚动超出边界有拖拽效果',
          routeName: BouncingScrollPhysicsScreen.routeName,
        ),
        ListTile(
          description: '内容超出时才有滚动，滚动不能超出边界',
          routeName: ClampingScrollPhysicsScreen.routeName,
        ),
        ListTile(
          description: '禁止滚动',
          routeName: NeverScrollableScrollPhysicsScreen.routeName,
        ),
      ],
    );
  }
}
