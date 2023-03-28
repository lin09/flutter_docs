import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  AnimatedContainer(
    ...
    duration: const Duration(seconds: 2),
    curve: Curves.fastOutSlowIn,
  ),
''';

class AnimatedContainerScreen extends ConsumerWidget {
  const AnimatedContainerScreen({super.key});

  static const routeName = 'widgets/AnimatedContainer';
  static const title = 'AnimatedContainer';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: 'Container 的动画版本。',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileAlignment(
          value: state.alignment,
          onSelectedItemChanged: notifier.setAlignment,
        ),
        ListTilePadding(
          value: state.padding,
          onSelectedItemChanged: notifier.setPadding,
        ),
        ListTileColor(
          value: state.color,
          onSelectedItemChanged: notifier.setColor,
        ),
        ListTileDecoration(
          valueWidth: 250,
          value: state.decoration,
          onSelectedItemChanged: notifier.setDecoration,
        ),
        ListTileDecoration(
          valueWidth: 160,
          name: 'foregroundDecoration',
          description: '前景装饰',
          value: state.foregroundDecoration,
          onSelectedItemChanged: notifier.setForegroundDecoration,
        ),
        ListTileWidth(
          value: state.width,
          onChanged: notifier.setWidth,
        ),
        ListTileHeight(
          value: state.height,
          onChanged: notifier.setHeight,
        ),
        ListTileBoxConstraints(
          name: 'constraints',
          description: '盒子大小限制',
          value: state.constraints,
          onSelectedItemChanged: notifier.setConstraints,
        ),
        ListTileMargin(
          value: state.margin,
          onSelectedItemChanged: notifier.setMargin,
        ),
        ListTileMatrix4(
          name: 'transform',
          value: state.transform,
          onSelectedItemChanged: notifier.setTransform,
        ),
        ListTileAlignment(
          name: 'transformAlignment',
          value: state.transformAlignment,
          onSelectedItemChanged: notifier.setTransformAlignment,
        ),
        ListTileCurve(
          value: state.curve,
          onSelectedItemChanged: notifier.setCurve,
        ),
        ListTileClip(
          name: 'clipBehavior',
          value: state.clipBehavior,
          onSelectedItemChanged: notifier.setClipBehavior,
        ),
        ListTileDuration(
          value: state.duration,
          onSelectedItemChanged: notifier.setDuration,
        ),
        const ListTileChild(),
        const ListTile(
          name: 'onEnd',
          description: '动画结束的回调',
          type: 'void Function()',
        ),
      ],
      inheritance: ImplicitlyAnimatedWidgetScreen.routeName,
      properties: const [
        ListTile(
          name: 'alignment → AlignmentGeometry?',
        ),
        ListTile(
          name: 'child → Widget?',
        ),
        ListTile(
          name: 'clipBehavior → Clip',
        ),
        ListTile(
          name: 'constraints → BoxConstraints?',
        ),
        ListTile(
          name: 'decoration → Decoration?',
        ),
        ListTile(
          name: 'foregroundDecoration → Decoration?',
        ),
        ListTile(
          name: 'margin → EdgeInsetsGeometry?',
        ),
        ListTile(
          name: 'padding → EdgeInsetsGeometry?',
        ),
        ListTile(
          name: 'transform → Matrix4?',
        ),
        ListTile(
          name: 'transformAlignment → AlignmentGeometry?',
        ),
      ],
      methods: const [
        ListTile(
          name: 'createState() → AnimatedWidgetBaseState<AnimatedContainer>',
        ),
        ListTile(
          name:
              'debugFillProperties(DiagnosticPropertiesBuilder properties) → void',
        ),
      ],
      seeAlso: const [
        AnimatedPaddingScreen.routeName,
        AnimatedPositionedScreen.routeName,
        AnimatedAlignScreen.routeName,
        AnimatedSwitcherScreen.routeName,
        AnimatedCrossFadeScreen.routeName,
      ],
    );
  }
}

final _stateProvider = StateNotifierProvider<_State, _Props>((ref) {
  return _State();
});

class _Props {
  _Props({
    this.alignment,
    this.padding,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    required this.clipBehavior,
    required this.curve,
    required this.duration,
  });

  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  Color? color;
  Decoration? decoration;
  final Decoration? foregroundDecoration;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  Clip clipBehavior;
  final Curve curve;
  final Duration duration;

  _Props.initial()
      : alignment = Alignment.topLeft,
        padding = null,
        color = null,
        decoration = null,
        foregroundDecoration = null,
        width = 50.0,
        height = 50.0,
        constraints = null,
        margin = null,
        transform = null,
        transformAlignment = null,
        clipBehavior = Clip.none,
        curve = Curves.linear,
        duration = const Duration(seconds: 1);

  _Props initial() => _Props.initial();

  _Props initialColor() {
    color = null;
    return this;
  }

  _Props initialDecoration() {
    initialClipBehavior();
    decoration = null;
    return this;
  }

  _Props initialClipBehavior() {
    clipBehavior = Clip.none;
    return this;
  }

  _Props copyWith({
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip? clipBehavior,
    Curve? curve,
    Duration? duration,
  }) {
    var decoration0 = decoration ?? this.decoration;
    var clipBehavior0 = clipBehavior ?? this.clipBehavior;
    if (decoration0 == null) {
      clipBehavior0 = Clip.none;
    }

    return _Props(
      alignment: alignment ?? this.alignment,
      padding: padding ?? this.padding,
      color: color ?? this.color,
      decoration: decoration0,
      foregroundDecoration: foregroundDecoration ?? this.foregroundDecoration,
      width: width ?? this.width,
      height: height ?? this.height,
      constraints: constraints ?? this.constraints,
      margin: margin ?? this.margin,
      transform: transform ?? this.transform,
      transformAlignment: transformAlignment ?? this.transformAlignment,
      clipBehavior: clipBehavior0,
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

  void setAlignment(AlignmentGeometry? value) {
    state = state.copyWith(alignment: value);
  }

  void setPadding(EdgeInsetsGeometry? value) {
    state = state.copyWith(padding: value);
  }

  void setColor(Color? value) {
    state = state.initialDecoration().copyWith(color: value);
  }

  void setDecoration(Decoration? value) {
    state = state.initialColor().copyWith(decoration: value);
  }

  void setForegroundDecoration(Decoration? value) {
    state = state.copyWith(foregroundDecoration: value);
  }

  void setWidth(double? value) {
    state = state.copyWith(width: value);
  }

  void setHeight(double? value) {
    state = state.copyWith(height: value);
  }

  void setConstraints(BoxConstraints? value) {
    state = state.copyWith(constraints: value);
  }

  void setMargin(EdgeInsetsGeometry? value) {
    state = state.copyWith(margin: value);
  }

  void setTransform(Matrix4? value) {
    state = state.copyWith(transform: value);
  }

  void setTransformAlignment(AlignmentGeometry? value) {
    state = state.copyWith(transformAlignment: value);
  }

  void setClipBehavior(Clip? value) {
    state = state.copyWith(clipBehavior: value);
  }

  void setCurve(Curve value) {
    state = state.copyWith(curve: value);
  }

  void setDuration(Duration value) {
    state = state.copyWith(duration: value);
  }
}

class _Sample extends StatelessWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Align(
        child: AnimatedContainer(
          alignment: state.alignment,
          padding: state.padding,
          color: state.color,
          decoration: state.decoration,
          foregroundDecoration: state.foregroundDecoration,
          width: state.width,
          height: state.height,
          constraints: state.constraints,
          margin: state.margin,
          transform: state.transform,
          transformAlignment: state.transformAlignment,
          clipBehavior: state.clipBehavior,
          curve: state.curve,
          duration: state.duration,
          child: Container(
            width: 10,
            height: 10,
            color: CupertinoColors.systemRed,
          ),
        ),
      ),
    );
  }
}
