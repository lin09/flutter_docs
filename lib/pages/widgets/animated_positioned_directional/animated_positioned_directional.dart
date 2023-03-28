import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  Stack(
    children: [
      AnimatedPositionedDirectional(
        duration: state.duration,
        curve: state.curve,
        ...
        child: Container(
          color: CupertinoColors.activeOrange,
        ...
      ),
      ...
    ],
  ),
  ...
''';

class AnimatedPositionedDirectionalScreen extends ConsumerWidget {
  const AnimatedPositionedDirectionalScreen({super.key});

  static const routeName = 'widgets/AnimatedPositionedDirectional';
  static const title = 'AnimatedPositionedDirectional';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '动画版本 AnimatedPositionedDirectional 。\n\n'
          '⚠️：只能在 Stack 的子级中才有效。\n'
          '⚠️：在同一方向的属性（如垂直方向： top 、 bottom 、 height ）不能同时设置3个，'
          '可以同时设置2个。',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileCurve(
          value: state.curve,
          onSelectedItemChanged: notifier.setCurve,
        ),
        ListTileDuration(
          value: state.duration,
          onSelectedItemChanged: notifier.setDuration,
        ),
        ListTileDouble(
          name: 'start',
          description: '文本开始方向偏移量',
          step: 10,
          value: state.start,
          onChanged: notifier.setStart,
        ),
        ListTileDouble(
          name: 'end',
          description: '文本结束方向偏移量',
          step: 10,
          value: state.end,
          onChanged: notifier.setEnd,
        ),
        ListTileDouble(
          name: 'top',
          description: '顶部偏移量',
          step: 10,
          value: state.top,
          onChanged: notifier.setTop,
        ),
        ListTileDouble(
          name: 'bottom',
          description: '底部偏移量',
          step: 10,
          value: state.bottom,
          onChanged: notifier.setBottom,
        ),
        ListTileWidth(
          value: state.width,
          onChanged: notifier.setWidth,
        ),
        ListTileHeight(
          value: state.height,
          onChanged: notifier.setHeight,
        ),
        const ListTile(
          name: 'onEnd',
          description: '动画结束的回调',
          type: 'void Function()',
        ),
      ],
      inheritance: ImplicitlyAnimatedWidgetScreen.routeName,
      properties: const [
        ListTile(
          name: 'bottom → double?',
        ),
        ListTile(
          name: 'child → Widget',
        ),
        ListTile(
          name: 'end → double?',
        ),
        ListTile(
          name: 'height → double?',
        ),
        ListTile(
          name: 'start → double?',
        ),
        ListTile(
          name: 'top → double?',
        ),
        ListTile(
          name: 'width → double?',
        ),
      ],
      methods: const [
        ListTile(
          name:
              'createState() → AnimatedWidgetBaseState<AnimatedPositionedDirectional>',
        ),
        ListTile(
          name:
              'debugFillProperties(DiagnosticPropertiesBuilder properties) → void',
        ),
      ],
      seeAlso: const [
        AnimatedPositionedDirectionalScreen.routeName,
      ],
    );
  }
}

final _stateProvider = StateNotifierProvider<_State, _Props>((ref) {
  return _State();
});

class _Props {
  _Props({
    required this.duration,
    this.curve = Curves.linear,
    this.start,
    this.top,
    this.end,
    this.bottom,
    this.width,
    this.height,
  });

  final Duration duration;
  final Curve curve;
  final double? start;
  final double? top;
  final double? end;
  final double? bottom;
  final double? width;
  final double? height;

  _Props.initial()
      : curve = Curves.linear,
        duration = const Duration(seconds: 1),
        start = null,
        top = null,
        end = null,
        bottom = null,
        width = null,
        height = null;

  _Props initial() => _Props.initial();

  _Props copyWith({
    Duration? duration,
    Curve? curve,
    double? start,
    double? top,
    double? end,
    double? bottom,
    double? width,
    double? height,
  }) {
    return _Props(
      duration: duration ?? this.duration,
      curve: curve ?? this.curve,
      start: start ?? this.start,
      top: top ?? this.top,
      end: end ?? this.end,
      bottom: bottom ?? this.bottom,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setCurve(Curve value) {
    state = state.copyWith(curve: value);
  }

  void setDuration(Duration value) {
    state = state.copyWith(duration: value);
  }

  bool? setStart(double value) {
    if (state.end != null && state.width != null) return false;
    state = state.copyWith(start: value);
    return null;
  }

  bool? setTop(double value) {
    if (state.bottom != null && state.height != null) return false;
    state = state.copyWith(top: value);
    return null;
  }

  bool? setEnd(double value) {
    if (state.start != null && state.width != null) return false;
    state = state.copyWith(end: value);
    return null;
  }

  bool? setBottom(double value) {
    if (state.top != null && state.height != null) return false;
    state = state.copyWith(bottom: value);
    return null;
  }

  bool? setWidth(double value) {
    if (state.end != null && state.start != null) return false;
    state = state.copyWith(width: value);
    return null;
  }

  bool? setHeight(double value) {
    if (state.top != null && state.bottom != null) return false;
    state = state.copyWith(height: value);
    return null;
  }
}

class _Sample extends StatelessWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        height: 150,
        color: CupertinoColors.activeBlue,
        child: Stack(
          children: [
            AnimatedPositionedDirectional(
              duration: state.duration,
              curve: state.curve,
              start: state.start,
              top: state.top,
              end: state.end,
              bottom: state.bottom,
              width: state.width,
              height: state.height,
              child: Container(
                color: CupertinoColors.activeOrange,
                child: const Text('a b c d'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
