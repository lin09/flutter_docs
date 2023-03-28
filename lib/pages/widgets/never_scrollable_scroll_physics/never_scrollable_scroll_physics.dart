import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  NeverScrollableScrollPhysics({ScrollPhysics? parent})

  // 例子
  CustomScrollView(
    physics: const NeverScrollableScrollPhysics(),
  ),
  ...
''';

class NeverScrollableScrollPhysicsScreen extends StatelessWidget {
  const NeverScrollableScrollPhysicsScreen({super.key});

  static const routeName = 'widgets/NeverScrollableScrollPhysics';
  static const title = 'NeverScrollableScrollPhysics';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: 'NeverScrollableScrollPhysics 用来禁止滚动。可运用到各种滚动部件中。',
      code: _code,
      parameters: [
        ListTile(
          name: 'parent',
          type: 'ScrollPhysics',
        ),
      ],
      inheritance: ScrollPhysicsScreen.routeName,
      methods: [
        ListTile(
          name:
              'applyTo(ScrollPhysics? ancestor) → NeverScrollableScrollPhysics',
        ),
        ListTile(
          name: 'shouldAcceptUserOffset(ScrollMetrics position) → bool',
        ),
      ],
      seeAlso: [
        ListTile(
          description: '始终可滚动，滚动超出边界有拖拽效果',
          routeName: AlwaysScrollableScrollPhysicsScreen.routeName,
        ),
        ListTile(
          description: '内容超出时才有滚动，滚动超出边界有拖拽效果',
          routeName: BouncingScrollPhysicsScreen.routeName,
        ),
        ListTile(
          description: '内容超出时才有滚动，滚动不能超出边界',
          routeName: ClampingScrollPhysicsScreen.routeName,
        ),
      ],
    );
  }
}
