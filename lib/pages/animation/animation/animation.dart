import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''源码
  abstract class Animation<T> extends Listenable
    implements ValueListenable<T> {

    const Animation();

    factory Animation.fromValueListenable(
        ValueListenable<T> listenable,
        {
          ValueListenableTransformer<T>? transformer,
        },
    ) = _ValueListenableDelegateAnimation<T>;

    ...
  }
''';

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({super.key});

  static const routeName = 'animation/Animation';
  static const title = 'Animation<T>';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: 'Animation 一个动画抽象类，主用于保存动画当前插值的和状态，在动画运行时'
          '会持续生成介于两个值之间的插入值。',
      code: _code,
      inheritance: ListenableScreen.routeName,
      implementedTypes: [ValueListenableScreen.routeName],
      properties: [
        ListTile(
          name: 'isCompleted → bool',
          description: '动画是否停止在终点',
        ),
        ListTile(
          name: 'isDismissed → bool',
          description: '动画是否停止在起点',
        ),
        ListTile(
          name: 'status → AnimationStatus',
          description: '动画当前的状态',
        ),
        ListTile(
          name: 'value → T',
          description: '动画当前的值',
        ),
      ],
      methods: [
        ListTile(
          name: 'addStatusListener(AnimationStatusListener listener) → void',
          description: '添加状态监听器事件',
        ),
        ListTile(
          name: 'drive<U>(Animatable<U> child) → Animation<U>',
          description: '将 Animatable 链接到此动画。',
        ),
        ListTile(
          name: 'removeStatusListener(AnimationStatusListener listener) → void',
          description: '移除状态监听器事件',
        ),
        ListTile(
          name: 'toStringDetails() → String',
          description: '提供描述此对象状态的字符串，但不包括有关对象本身的信息。',
        ),
      ],
      implementers: [
        AlwaysStoppedAnimationScreen.routeName,
        AnimationControllerScreen.routeName,
        CompoundAnimationScreen.routeName,
        CurvedAnimationScreen.routeName,
        ProxyAnimationScreen.routeName,
        ReverseAnimationScreen.routeName,
        TrainHoppingAnimationScreen.routeName,
      ],
    );
  }
}
