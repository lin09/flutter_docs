import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  AnimatedPhysicalModel(
    duration: state.duration,
    curve: state.curve,
    ...
  ),
  ...
''';

class AnimatedPhysicalModelScreen extends ConsumerWidget {
  const AnimatedPhysicalModelScreen({super.key});

  static const routeName = 'widgets/AnimatedPhysicalModel';
  static const title = 'AnimatedPhysicalModel';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '动画版本的 PhysicalModel',
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
        ListTileBoxShape(
          value: state.shape,
          onSelectedItemChanged: notifier.setShape,
        ),
        ListTileClip(
          name: 'clipBehavior',
          value: state.clipBehavior,
          onSelectedItemChanged: notifier.setClipBehavior,
        ),
        ListTileBorderRadius(
          value: state.borderRadius,
          onSelectedItemChanged: notifier.setBorderRadius,
        ),
        ListTileDouble(
          name: 'elevation',
          description: '海拔（z坐标）',
          step: 10,
          value: state.elevation,
          onChanged: notifier.setElevation,
        ),
        ListTileColor(
          value: state.color,
          onSelectedItemChanged: notifier.setColor,
        ),
        ListTileSwitch(
          name: 'animateColor',
          description: '是否设置颜色动画。',
          value: state.animateColor,
          onChanged: notifier.setAnimateColor,
        ),
        ListTileColor(
          name: 'shadowColor',
          description: '阴影颜色',
          value: state.shadowColor,
          onSelectedItemChanged: notifier.setShadowColor,
        ),
        ListTileSwitch(
          name: 'animateColor',
          description: '是否设置阴影颜色动画。',
          value: state.animateShadowColor,
          onChanged: notifier.setAnimateShadowColor,
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
          name: 'animateColor → bool',
        ),
        ListTile(
          name: 'animateShadowColor → bool',
        ),
        ListTile(
          name: 'borderRadius → BorderRadius',
        ),
        ListTile(
          name: 'child → Widget',
        ),
        ListTile(
          name: 'clipBehavior → Clip',
        ),
        ListTile(
          name: 'color → Color',
        ),
        ListTile(
          name: 'elevation → double',
        ),
        ListTile(
          name: 'shadowColor → Color',
        ),
        ListTile(
          name: 'shape → BoxShape',
        ),
      ],
      methods: const [
        ListTile(
          name:
              'createState() → AnimatedWidgetBaseState<AnimatedPhysicalModel>',
        ),
        ListTile(
          name:
              'debugFillProperties(DiagnosticPropertiesBuilder properties) → void',
        ),
      ],
    );
  }
}

final _stateProvider = StateNotifierProvider<_State, _Props>((ref) {
  return _State();
});

class _Props {
  _Props({
    required this.shape,
    this.clipBehavior = Clip.none,
    this.borderRadius = BorderRadius.zero,
    required this.elevation,
    required this.color,
    this.animateColor = true,
    required this.shadowColor,
    this.animateShadowColor = true,
    this.curve = Curves.linear,
    required this.duration,
  });

  final BoxShape shape;
  final Clip clipBehavior;
  final BorderRadius borderRadius;
  final double elevation;
  final Color color;
  final bool animateColor;
  final Color shadowColor;
  final bool animateShadowColor;
  final Curve curve;
  final Duration duration;

  _Props.initial()
      : shape = BoxShape.rectangle,
        duration = const Duration(seconds: 1),
        curve = Curves.linear,
        clipBehavior = Clip.none,
        borderRadius = BorderRadius.zero,
        elevation = 10,
        color = CupertinoColors.activeBlue,
        animateColor = true,
        shadowColor = CupertinoColors.black,
        animateShadowColor = true;

  _Props initial() => _Props.initial();

  _Props copyWith({
    BoxShape? shape,
    Clip? clipBehavior,
    BorderRadius? borderRadius,
    double? elevation,
    Color? color,
    bool? animateColor,
    Color? shadowColor,
    bool? animateShadowColor,
    Curve? curve,
    Duration? duration,
  }) {
    return _Props(
      shape: shape ?? this.shape,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      borderRadius: borderRadius ?? this.borderRadius,
      elevation: elevation ?? this.elevation,
      color: color ?? this.color,
      animateColor: animateColor ?? this.animateColor,
      shadowColor: shadowColor ?? this.shadowColor,
      animateShadowColor: animateShadowColor ?? this.animateShadowColor,
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setShape(BoxShape value) {
    state = state.copyWith(shape: value);
  }

  void setClipBehavior(Clip value) {
    state = state.copyWith(clipBehavior: value);
  }

  void setBorderRadius(BorderRadius value) {
    state = state.copyWith(borderRadius: value);
  }

  void setElevation(double value) {
    state = state.copyWith(elevation: value);
  }

  void setColor(Color value) {
    state = state.copyWith(color: value);
  }

  void setAnimateColor(bool value) {
    state = state.copyWith(animateColor: value);
  }

  void setShadowColor(Color value) {
    state = state.copyWith(shadowColor: value);
  }

  void setAnimateShadowColor(bool value) {
    state = state.copyWith(animateShadowColor: value);
  }

  void setDuration(Duration value) {
    state = state.copyWith(duration: value);
  }

  void setCurve(Curve value) {
    state = state.copyWith(curve: value);
  }
}

class _Sample extends StatelessWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      child: AnimatedPhysicalModel(
        shape: state.shape,
        clipBehavior: state.clipBehavior,
        borderRadius: state.borderRadius,
        elevation: state.elevation,
        color: state.color,
        animateColor: state.animateColor,
        shadowColor: state.shadowColor,
        animateShadowColor: state.animateShadowColor,
        curve: state.curve,
        duration: state.duration,
        child: const SizedBox(width: 50, height: 50),
      ),
    );
  }
}
