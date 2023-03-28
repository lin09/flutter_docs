import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';
import 'package:flutter_docs/pages.dart';

const _code = '''|
  ClampingScrollPhysics({ScrollPhysics? parent})

  // 例子
  CustomScrollView(
    physics: const ClampingScrollPhysics(),
  )
''';

class ClampingScrollPhysicsScreen extends StatelessWidget {
  const ClampingScrollPhysicsScreen({super.key});

  static const routeName = 'widgets/ClampingScrollPhysics';
  static const title = 'ClampingScrollPhysics';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: 'ClampingScrollPhysics 是一种滚动行为，内容超出时才有滚动，滚动不能'
          '超出边界。可运用到各种滚动部件中。',
      code: _code,
      parameters: [
        ListTile(
          name: 'parent',
          type: 'ScrollPhysics',
        ),
      ],
      inheritance: ScrollPhysicsScreen.routeName,
      properties: [
        ListTile(
          name:
              'applyBoundaryConditions(ScrollMetrics position, double value) → double',
        ),
        ListTile(
          name: 'applyTo(ScrollPhysics? ancestor) → ClampingScrollPhysics',
        ),
        ListTile(
          name:
              'createBallisticSimulation(ScrollMetrics position, double velocity) → Simulation?',
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
          description: '禁止滚动',
          routeName: NeverScrollableScrollPhysicsScreen.routeName,
        ),
        ScrollConfigurationScreen.routeName,
        GlowingOverscrollIndicatorScreen.routeName,
      ],
    );
  }
}
