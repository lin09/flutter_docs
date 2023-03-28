import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  Stack(
    children: [
      AnimatedPositioned(
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

class AnimatedPositionedScreen extends ConsumerWidget {
  const AnimatedPositionedScreen({super.key});

  static const routeName = 'widgets/AnimatedPositioned';
  static const title = 'AnimatedPositioned';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_stateProvider);
    final notifier = ref.read(_stateProvider.notifier);

    return PageScaffold(
      title: title,
      explanation: '动画版本 AnimatedPositioned 。\n\n'
          '⚠️：只能在 Stack 的子级中才有效。\n'
          '⚠️：在同一方向的属性（如水平方向： left 、 right 、 width ）不能同时设置3个，'
          '可以同时设置2个。',
      code: _code,
      sample: _Sample(state, notifier),
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
          name: 'left',
          description: '左偏移量',
          step: 10,
          value: state.left,
          onChanged: notifier.setLeft,
        ),
        ListTileDouble(
          name: 'right',
          description: '右偏移量',
          step: 10,
          value: state.right,
          onChanged: notifier.setRight,
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
          name: 'height → double?',
        ),
        ListTile(
          name: 'left → double?',
        ),
        ListTile(
          name: 'right → double?',
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
          name: 'createState() → AnimatedWidgetBaseState<AnimatedPositioned>',
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
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.width,
    this.height,
    this.childSized = false,
  });

  final Duration duration;
  final Curve curve;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final double? width;
  final double? height;
  final bool childSized;

  _Props.initial({bool sized = false})
      : curve = Curves.linear,
        duration = const Duration(seconds: 1),
        left = null,
        top = null,
        right = null,
        bottom = null,
        width = null,
        height = null,
        childSized = sized;

  _Props initial() => _Props.initial(sized: childSized);

  _Props copyWith({
    Duration? duration,
    Curve? curve,
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
    bool? childSized,
  }) {
    return _Props(
      duration: duration ?? this.duration,
      curve: curve ?? this.curve,
      left: left ?? this.left,
      top: top ?? this.top,
      right: right ?? this.right,
      bottom: bottom ?? this.bottom,
      width: width ?? this.width,
      height: height ?? this.height,
      childSized: childSized ?? this.childSized,
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

  bool? setLeft(double value) {
    if (state.right != null && state.width != null) return false;
    state = state.copyWith(left: value);
    return null;
  }

  bool? setTop(double value) {
    if (state.bottom != null && state.height != null) return false;
    state = state.copyWith(top: value);
    return null;
  }

  bool? setRight(double value) {
    if (state.left != null && state.width != null) return false;
    state = state.copyWith(right: value);
    return null;
  }

  bool? setBottom(double value) {
    if (state.top != null && state.height != null) return false;
    state = state.copyWith(bottom: value);
    return null;
  }

  bool? setWidth(double value) {
    if (state.right != null && state.left != null) return false;
    state = state.copyWith(width: value);
    return null;
  }

  bool? setHeight(double value) {
    if (state.top != null && state.bottom != null) return false;
    state = state.copyWith(height: value);
    return null;
  }

  void setChildSized(bool value) {
    state = state.copyWith(childSized: value);
  }
}

class _Sample extends StatelessWidget {
  const _Sample(this.state, this.notifier);

  final _Props state;
  final _State notifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTileSwitch(
          name: '设置子部件(橙色)大小 20*20',
          description: '',
          value: state.childSized,
          onChanged: notifier.setChildSized,
        ),
        Container(
          width: 150,
          height: 150,
          color: CupertinoColors.activeBlue,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: state.duration,
                curve: state.curve,
                left: state.left,
                top: state.top,
                right: state.right,
                bottom: state.bottom,
                width: state.width,
                height: state.height,
                child: Container(
                  color: CupertinoColors.activeOrange,
                  width: state.childSized ? 20 : null,
                  height: state.childSized ? 20 : null,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
