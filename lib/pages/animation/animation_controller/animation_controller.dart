import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  // 创建一个动画控制器
  AnimationController({
    double? value,
    Duration? duration,
    Duration? reverseDuration,
    String? debugLabel,
    double lowerBound = 0.0,
    double upperBound = 1.0,
    AnimationBehavior animationBehavior =
        AnimationBehavior.normal,
    required TickerProvider vsync,
  })

  // 创建一个动画控制器，其值没有上限或下限。
  AnimationController.unbounded({
    double value = 0.0,
    Duration? duration,
    Duration? reverseDuration,
    String? debugLabel,
    AnimationBehavior animationBehavior =
        AnimationBehavior.preserve,
    required TickerProvider vsync,
  })
''';

class AnimationControllerScreen extends StatelessWidget {
  const AnimationControllerScreen({super.key});

  static const routeName = 'animation/AnimationController';
  static const title = 'AnimationController';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: 'AnimationController 用来控制动画的状态启动、暂停、反向运行等。',
      code: _code,
      parameters: [
        ListTile(
          name: 'value',
          description: '初始值',
          type: 'double',
        ),
        ListTile(
          name: 'lowerBound',
          description: '开始值',
          type: 'double',
        ),
        ListTile(
          name: 'upperBound',
          description: '结束值',
          type: 'double',
        ),
        ListTile(
          name: 'duration',
          description: '动画时间',
          type: 'Duration',
        ),
        ListTile(
          name: 'reverseDuration',
          description: '反向动画执行的时间',
          type: 'Duration',
        ),
        ListTile(
          name: 'animationBehavior',
          description: '平台禁用动画时 AnimationController 的行为',
          type: 'AnimationBehavior',
        ),
        ListTile(
          name: 'vsync',
          description: '垂直同步',
          type: 'TickerProvider',
        ),
      ],
      inheritance: AnimationScreen.routeName,
      mixedInTypes: [
        AnimationEagerListenerMixinScreen.routeName,
        AnimationLocalListenersMixinScreen.routeName,
        AnimationLocalStatusListenersMixinScreen.routeName,
      ],
      properties: [
        ListTile(
          name: 'animationBehavior → AnimationBehavior',
        ),
        ListTile(
          name: 'debugLabel → String?',
        ),
        ListTile(
          name: 'duration ↔ Duration?',
        ),
        ListTile(
          name: 'isAnimating → bool',
        ),
        ListTile(
          name: 'lastElapsedDuration → Duration?',
        ),
        ListTile(
          name: 'lowerBound → double',
        ),
        ListTile(
          name: 'reverseDuration ↔ Duration?',
        ),
        ListTile(
          name: 'upperBound → double',
        ),
        ListTile(
          name: 'value ↔ double',
        ),
        ListTile(
          name: 'velocity → double',
        ),
        ListTile(
          name: 'view → Animation<double>',
        ),
      ],
      methods: [
        ListTile(
          name: 'animateBack(double target, {Duration? duration, Curve curve = '
              'Curves.linear}) → TickerFuture',
          description: '动画控制器会在持续时间内线性地从当前值到给定目标值进行插值补间。如'
              '果方法没有指定持续时间，则使用控制器的默认持续时间和控制器的上下限范围来确定动'
              '画的速度。',
        ),
        ListTile(
          name: 'animateTo(double target, {Duration? duration, Curve curve = '
              'Curves.linear}) → TickerFuture',
          description: '动画控制器会在持续时间内线性地从当前值到给定目标值进行插值补间。如'
              '果方法没有指定持续时间，则使用控制器的默认持续时间和控制器的上下限范围来确定动'
              '画的速度。',
        ),
        ListTile(
          name: 'animateWith(Simulation simulation) → TickerFuture',
          description: '给定的模拟器会被用于驱动控制器。这些方法都会返回 Ticker 提供的将'
              '来值，交由控制器下一次停止或改变模拟器时来完成。',
        ),
        ListTile(
          name: 'fling({double velocity = 1.0, SpringDescription? '
              'springDescription, AnimationBehavior? animationBehavior}) → '
              'TickerFuture',
          description: '一个 Force 被用来创建一个特定的模拟器，然后用来驱动控制器。',
        ),
        ListTile(
          name: 'forward({double? from}) → TickerFuture',
          description: '开始向前（朝向结尾）运行此动画。',
        ),
        ListTile(
          name: 'repeat({double? min, double? max, bool reverse = false, '
              'Duration? period}) → TickerFuture',
          description: '动画控制器会在持续时间内线性地在上下边界之间进行插值补间，但会一直'
              '重复，不会停止。',
        ),
        ListTile(
          name: 'reset() → void',
          description: '重置动画',
        ),
        ListTile(
          name: 'resync(TickerProvider vsync) → void',
          description: '绑定新的 vsync',
        ),
        ListTile(
          name: 'reverse({double? from}) → TickerFuture',
          description: '开始反向运行此动画（朝向开头）。',
        ),
        ListTile(
          name: 'stop({bool canceled = true}) → void',
          description: '停止动画',
        ),
      ],
    );
  }
}
