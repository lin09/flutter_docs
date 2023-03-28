import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show FlutterLogo;

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  /// 自定义 AnimatedWidget 子类部件
  class Xxx extends AnimatedWidget {
    const Xxx({
      super.key,
      required Animation<type> animation,
    }) : super(listenable: animation);

    Animation<type> get _progress =>
      listenable as Animation<type>;

    @override
    Widget build(BuildContext context) {...}
  }
''';

class AnimatedWidgetScreen extends StatelessWidget {
  const AnimatedWidgetScreen({super.key});

  static const routeName = 'widgets/AnimatedWidget';
  static const title = 'AnimatedWidget';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: title,
      explanation: 'AnimatedWidget 是一个动画抽象类。listenable 更改值时会重新构建。\n\n'
          '最常用于可监听的动画对象，可以与任何可监听对象一起使用，包括 ChangeNotifier  和'
          ' ValueNotifier 。\n\n'
          'AnimatedWidget 对于无状态的部件非常有用。要使用 AnimatedWidget，只需将其子类'
          '化并实现构建函数。',
      code: _code,
      sample: _Sample(),
      parameters: const [
        ListTile(
          name: 'listenable',
          description: '可监听对象',
          type: 'Listenable',
          routeName: ListenableScreen.routeName,
        ),
      ],
      inheritance: StatefulWidgetScreen.routeName,
      properties: const [
        ListTile(
          name: 'listenable → Listenable',
        ),
      ],
      methods: const [
        ListTile(
          name: 'build(BuildContext context) → Widget',
        ),
        ListTile(
          name: 'createState() → State<AnimatedWidget>',
        ),
        ListTile(
          name:
              'debugFillProperties(DiagnosticPropertiesBuilder properties) → void',
        ),
      ],
      implementers: const [
        AlignTransitionScreen.routeName,
        AnimatedBuilderScreen.routeName,
        AnimatedModalBarrierScreen.routeName,
        DecoratedBoxTransitionScreen.routeName,
        DefaultTextStyleTransitionScreen.routeName,
        PositionedTransitionScreen.routeName,
        RelativePositionedTransitionScreen.routeName,
        RotationTransitionScreen.routeName,
        ScaleTransitionScreen.routeName,
        ScaleTransitionScreen.routeName,
        SizeTransitionScreen.routeName,
        SlideTransitionScreen.routeName,
      ],
      seeAlso: const [
        AnimatedBuilderScreen.routeName,
        AlignTransitionScreen.routeName,
        DecoratedBoxTransitionScreen.routeName,
        DefaultTextStyleTransitionScreen.routeName,
        PositionedTransitionScreen.routeName,
        RelativePositionedTransitionScreen.routeName,
        RotationTransitionScreen.routeName,
        ScaleTransitionScreen.routeName,
        SizeTransitionScreen.routeName,
        SlideTransitionScreen.routeName,
        FadeTransitionScreen.routeName,
        AnimatedModalBarrierScreen.routeName,
      ],
    );
  }
}

class _Sample extends StatefulWidget {
  @override
  State<_Sample> createState() => _SampleState();
}

class _SampleState extends State<_Sample> with TickerProviderStateMixin {
  late final _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation =
      Tween<double>(begin: 0, end: 2).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: 50,
      child: _SizeTransition(scale: _animation),
    );
  }
}

// 自定义动画部件
class _SizeTransition extends AnimatedWidget {
  const _SizeTransition({required Animation<double> scale})
      : super(listenable: scale);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _progress.value,
      child: const FlutterLogo(),
    );
  }
}
