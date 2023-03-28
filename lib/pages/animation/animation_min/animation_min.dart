import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  var animationMin = AnimationMin(first, next);

  // math.min(first.value, next.value)
  print(animationMin.value);
''';

class AnimationMinScreen extends StatelessWidget {
  const AnimationMinScreen({super.key});

  static const routeName = 'animation/AnimationMin';
  static const title = 'AnimationMin<T extends num>';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '跟踪2个 Animation<T> ，获取最小 value',
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
          description: '当前两个动画中比较小的 value',
        ),
      ],
    );
  }
}
