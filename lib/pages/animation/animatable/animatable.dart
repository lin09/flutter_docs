import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''源码
  abstract class Animatable<T> {
    const Animatable();

    const factory Animatable.fromCallback(
      AnimatableCallback<T> callback
    ) = _CallbackAnimatable<T>;
    ...
  }
''';

class AnimatableScreen extends StatelessWidget {
  const AnimatableScreen({super.key});

  static const routeName = 'animation/Animatable';
  static const title = 'Animatable<T>';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: 'Animatable 用于表明动画值范围值。可以通过调用 animate 方法，返回一个 Animation 。',
      code: _code,
      methods: [
        ListTile(
          name: 'animate(Animation<double> parent) → Animation<T>',
          description: '获取 Animation 值',
        ),
        ListTile(
          name: 'chain(Animatable<double> parent) → Animatable<T>',
          description: '叠加多个 Animatable',
        ),
        ListTile(
          name: 'evaluate(Animation<double> animation) → T',
          description: '获取 Animation 当前帧的状态值',
        ),
        ListTile(
          name: 'transform(double t) → T',
          description: '获取 t 点的值',
        ),
      ],
      implementers: [
        ListTile(
          description: '曲线动画插值',
          routeName: CurveTweenScreen.routeName,
        ),
        ListTile(
          description: '线性动画插值',
          routeName: TweenScreen.routeName,
        ),
        ListTile(
          description: 'Tween 组',
          routeName: TweenSequenceScreen.routeName,
        ),
      ],
    );
  }
}
