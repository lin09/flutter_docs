import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show FlutterLogo;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  import 'dart:math';
  ...

  late final AnimationController _controller =
    AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  ...
  SizedBox(
    height: 100,
    child: AnimatedBuilder(
      animation: _controller,
      child: const FlutterLogo(),
      builder: (context, child) => Transform.rotate(
        angle: _controller.value * 2.0 * pi,
        child: child,
      ),
    ),
  ),
  ...
''';

class AnimatedBuilderScreen extends ConsumerWidget {
  const AnimatedBuilderScreen({super.key});

  static const routeName = 'widgets/AnimatedBuilder';
  static const title = 'AnimatedBuilder';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageScaffold(
      title: title,
      explanation: 'AnimatedBuilder 用于生成动画的通用小部件, 对于希望在更大的构建函数中'
          '包含动画的更复杂的小部件非常有用。',
      code: _code,
      sample: _Sample(),
      parameters: const [
        ListTile(
          name: 'animation',
          description: '动画',
          type: 'Listenable',
        ),
        ListTile(
          name: 'builder',
          description: '每次动画更改值时调用。',
          type: 'TransitionBuilder',
        ),
        ListTileChild(),
      ],
      inheritance: AnimatedWidgetScreen.routeName,
      properties: const [
        ListTile(
          name: 'builder → TransitionBuilder',
        ),
        ListTile(
          name: 'child → Widget?',
        ),
      ],
      methods: const [
        ListTile(
          name: 'build(BuildContext context) → Widget',
        ),
      ],
      seeAlso: const [
        TweenAnimationBuilderScreen.routeName,
      ],
    );
  }
}

class _Sample extends StatefulWidget {
  @override
  State<_Sample> createState() => _SampleState();
}

class _SampleState extends State<_Sample> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: AnimatedBuilder(
        animation: _controller,
        child: const FlutterLogo(),
        builder: (context, child) => Transform.rotate(
          angle: _controller.value * 2.0 * pi,
          child: child,
        ),
      ),
    );
  }
}
