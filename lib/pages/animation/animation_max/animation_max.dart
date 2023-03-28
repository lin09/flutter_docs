import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  var animationMax = AnimationMax(first, next);

  // math.max(first.value, next.value)
  print(animationMax.value);
''';

class AnimationMaxScreen extends StatelessWidget {
  const AnimationMaxScreen({super.key});

  static const routeName = 'animation/AnimationMax';
  static const title = 'AnimationMax<T extends num>';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '跟踪2个 Animation<T> ，获取最大 value',
      code: _code,
      parameters: [
        ListTile(
          name: 'first',
          description: '动画',
          type: 'Animation<T>',
        ),
        ListTile(
          name: 'next',
          description: '动画',
          type: 'Animation<T>',
        ),
      ],
      inheritance: CompoundAnimationScreen.routeName,
      properties: [
        ListTile(
          name: 'value → T',
          description: '当前两个动画中比较大的 value',
        ),
      ],
    );
  }
}
