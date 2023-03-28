import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  var animationMean = AnimationMean(left, right);

  // (first.value + next.value) / 2.0
  print(animationMean.value);
''';

class AnimationMeanScreen extends StatelessWidget {
  const AnimationMeanScreen({super.key});

  static const routeName = 'animation/AnimationMean';
  static const title = 'AnimationMean';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '跟踪2个 Animation<T> ，获取平均 value 值',
      code: _code,
      parameters: [
        ListTile(
          name: 'left',
          description: '动画',
          type: 'Animation<double>',
        ),
        ListTile(
          name: 'right',
          description: '动画',
          type: 'Animation<double>',
        ),
      ],
      inheritance: CompoundAnimationScreen.routeName,
      properties: [
        ListTile(
          name: 'value → double',
          description: '当前两个动画平均 value',
        ),
      ],
    );
  }
}
