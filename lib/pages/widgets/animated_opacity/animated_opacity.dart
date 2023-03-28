import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  AnimatedOpacity(
    opacity: state.opacity,
    duration: state.duration,
    curve: state.curve,
    child: Container(
      color: CupertinoColors.activeBlue,
      width: 50,
      height: 50,
    ),
    ...
  ),
  ...
''';

class AnimatedOpacityScreen extends ConsumerWidget {
  const AnimatedOpacityScreen({super.key});

  static const routeName = 'widgets/AnimatedOpacity';
  static const title = 'AnimatedOpacity';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '动画版本的 Opacity',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileOpacity(
          value: state.opacity,
          onChanged: notifier.setOpacity,
        ),
        ListTileCurve(
          value: state.curve,
          onSelectedItemChanged: notifier.setCurve,
        ),
        ListTileDuration(
          value: state.duration,
          onSelectedItemChanged: notifier.setDuration,
        ),
        ListTileSwitch(
          name: 'alwaysIncludeSemantics',
          description: '是否始终包含子对象的语义信息。',
          value: state.alwaysIncludeSemantics,
          onChanged: notifier.setAlwaysIncludeSemantics,
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
          name: 'alwaysIncludeSemantics → bool',
        ),
        ListTile(
          name: 'child → Widget?',
        ),
        ListTile(
          name: 'opacity → double',
        ),
      ],
      methods: const [
        ListTile(
          name:
              'createState() → ImplicitlyAnimatedWidgetState<AnimatedOpacity>',
        ),
        ListTile(
          name:
              'debugFillProperties(DiagnosticPropertiesBuilder properties) → void',
        ),
      ],
      seeAlso: const [
        AnimatedCrossFadeScreen.routeName,
        AnimatedSwitcherScreen.routeName,
        FadeTransitionScreen.routeName,
        SliverAnimatedOpacityScreen.routeName,
      ],
    );
  }
}

final _stateProvider = StateNotifierProvider<_State, _Props>((ref) {
  return _State();
});

class _Props {
  _Props({
    required this.opacity,
    required this.duration,
    this.curve = Curves.linear,
    this.alwaysIncludeSemantics = false,
  });

  final double opacity;
  final Duration duration;
  final Curve curve;
  final bool alwaysIncludeSemantics;

  _Props.initial()
      : opacity = 1,
        duration = const Duration(seconds: 2),
        curve = Curves.linear,
        alwaysIncludeSemantics = false;

  _Props initial() => _Props.initial();

  _Props copyWith({
    double? opacity,
    Duration? duration,
    Curve? curve,
    bool? alwaysIncludeSemantics,
  }) {
    return _Props(
      opacity: opacity ?? this.opacity,
      duration: duration ?? this.duration,
      curve: curve ?? this.curve,
      alwaysIncludeSemantics:
          alwaysIncludeSemantics ?? this.alwaysIncludeSemantics,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setOpacity(double value) {
    state = state.copyWith(opacity: value);
  }

  void setDuration(Duration value) {
    state = state.copyWith(duration: value);
  }

  void setCurve(Curve value) {
    state = state.copyWith(curve: value);
  }

  void setAlwaysIncludeSemantics(bool value) {
    state = state.copyWith(alwaysIncludeSemantics: value);
  }
}

class _Sample extends StatelessWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: AnimatedOpacity(
        opacity: state.opacity,
        duration: state.duration,
        curve: state.curve,
        alwaysIncludeSemantics: state.alwaysIncludeSemantics,
        child: Container(
          color: CupertinoColors.activeBlue,
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}
