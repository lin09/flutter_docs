import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';
import 'package:flutter_docs/pages.dart';

const _code = '''|
  BouncingScrollPhysics({
    ScrollDecelerationRate decelerationRate =
      ScrollDecelerationRate.normal,
    ScrollPhysics? parent
  })

  // 例子
  CustomScrollView(
    physics: const BouncingScrollPhysics(),
  )
''';

class BouncingScrollPhysicsScreen extends StatelessWidget {
  const BouncingScrollPhysicsScreen({super.key});

  static const routeName = 'widgets/BouncingScrollPhysics';
  static const title = 'BouncingScrollPhysics';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: 'BouncingScrollPhysics 是一种滚动行为，内容超出时才有滚动，滚动超出边'
          '界有拖拽效果（IOS回弹效果，安卓发光效果）。可运用到各种滚动部件中。',
      code: _code,
      parameters: [
        ListTile(
          name: 'decelerationRate',
          type: 'ScrollDecelerationRate',
        ),
        ListTile(
          name: 'parent',
          type: 'ScrollPhysics',
        ),
      ],
      inheritance: ScrollPhysicsScreen.routeName,
      properties: [
        ListTile(
          name: 'decelerationRate → ScrollDecelerationRate',
        ),
        ListTile(
          name: 'dragStartDistanceMotionThreshold → double',
        ),
        ListTile(
          name: 'maxFlingVelocity → double',
        ),
        ListTile(
          name: 'minFlingVelocity → double',
        ),
        ListTile(
          name: 'spring → SpringDescription',
        ),
      ],
      methods: [
        ListTile(
          name:
              'applyBoundaryConditions(ScrollMetrics position, double value) → double',
        ),
        ListTile(
          name:
              'applyPhysicsToUserOffset(ScrollMetrics position, double offset) → double',
        ),
        ListTile(
          name: 'applyTo(ScrollPhysics? ancestor) → BouncingScrollPhysics',
        ),
        ListTile(
          name: 'carriedMomentum(double existingVelocity) → double',
        ),
        ListTile(
          name:
              'createBallisticSimulation(ScrollMetrics position, double velocity) → Simulation?',
        ),
        ListTile(
          name: 'frictionFactor(double overscrollFraction) → double',
        ),
      ],
      seeAlso: [
        ListTile(
          description: '始终可滚动，滚动超出边界有拖拽效果',
          routeName: AlwaysScrollableScrollPhysicsScreen.routeName,
        ),
        ListTile(
          description: '内容超出时才有滚动，滚动不能超出边界',
          routeName: ClampingScrollPhysicsScreen.routeName,
        ),
        ListTile(
          description: '禁止滚动',
          routeName: NeverScrollableScrollPhysicsScreen.routeName,
        ),
        ScrollConfigurationScreen.routeName,
      ],
    );
  }
}
