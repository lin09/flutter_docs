import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  child: AnimatedFractionallySizedBox(
    widthFactor: selected ? 0.25 : 0.75,
    heightFactor: selected ? 0.75 : 0.25,
    alignment: selected ? Alignment.topLeft : Alignment.bottomRight,
    duration: const Duration(seconds: 1),
    curve: Curves.fastOutSlowIn,
    child: Container(
      color: CupertinoColors.activeBlue,
    ),
  ),
  ...
''';

class AnimatedFractionallySizedBoxScreen extends ConsumerWidget {
  const AnimatedFractionallySizedBoxScreen({super.key});

  static const routeName = 'widgets/AnimatedFractionallySizedBox';
  static const title = 'AnimatedFractionallySizedBox';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '动画版本 FractionallySizedBox 。',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileAlignment(
          value: state.alignment,
          onSelectedItemChanged: notifier.setAlignment,
        ),
        ListTileCurve(
          value: state.curve,
          onSelectedItemChanged: notifier.setCurve,
        ),
        ListTileDuration(
          value: state.duration,
          onSelectedItemChanged: notifier.setDuration,
        ),
        ListTileWidthFactor(
          description: '设置子部件的宽度为部件宽度乘以该系数',
          step: 0.25,
          value: state.widthFactor,
          onChanged: notifier.setWidthFactor,
        ),
        ListTileHeightFactor(
          description: '设置子部件的高度为部件高度乘以该系数',
          step: 0.25,
          value: state.heightFactor,
          onChanged: notifier.setHeightFactor,
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
          name: 'alignment → AlignmentGeometry',
        ),
        ListTile(
          name: 'child → Widget?',
        ),
        ListTile(
          name: 'heightFactor → double?',
        ),
        ListTile(
          name: 'widthFactor → double?',
        ),
      ],
      methods: const [
        ListTile(
          name:
              'createState() → AnimatedWidgetBaseState<AnimatedFractionallySizedBox>',
        ),
        ListTile(
          name:
              'debugFillProperties(DiagnosticPropertiesBuilder properties) → void',
        ),
      ],
      seeAlso: const [
        AnimatedAlignScreen.routeName,
        AnimatedContainerScreen.routeName,
        AnimatedSlideScreen.routeName,
        AnimatedPositionedScreen.routeName,
      ],
    );
  }
}

final _stateProvider = StateNotifierProvider<_State, _Props>((ref) {
  return _State();
});

class _Props {
  _Props({
    required this.alignment,
    required this.duration,
    required this.curve,
    this.widthFactor,
    this.heightFactor,
  });

  final AlignmentGeometry alignment;
  final Duration duration;
  final Curve curve;
  final double? widthFactor;
  final double? heightFactor;

  _Props.initial()
      : alignment = Alignment.center,
        duration = const Duration(seconds: 1),
        curve = Curves.linear,
        widthFactor = null,
        heightFactor = null;

  _Props initial() => _Props.initial();

  _Props copyWith({
    AlignmentGeometry? alignment,
    Duration? duration,
    Curve? curve,
    double? widthFactor,
    double? heightFactor,
  }) {
    return _Props(
      alignment: alignment ?? this.alignment,
      duration: duration ?? this.duration,
      curve: curve ?? this.curve,
      widthFactor: widthFactor ?? this.widthFactor,
      heightFactor: heightFactor ?? this.heightFactor,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setAlignment(AlignmentGeometry value) {
    state = state.copyWith(alignment: value);
  }

  void setDuration(Duration value) {
    state = state.copyWith(duration: value);
  }

  void setCurve(Curve value) {
    state = state.copyWith(curve: value);
  }

  void setWidthFactor(double value) {
    state = state.copyWith(widthFactor: value);
  }

  void setHeightFactor(double value) {
    state = state.copyWith(heightFactor: value);
  }
}

class _Sample extends StatelessWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      alignment: Alignment.center,
      child: Container(
        width: 120,
        height: 120,
        color: CupertinoColors.activeOrange,
        child: AnimatedFractionallySizedBox(
          alignment: state.alignment,
          duration: state.duration,
          curve: state.curve,
          widthFactor: state.widthFactor,
          heightFactor: state.heightFactor,
          child: Container(
            color: const Color(0xa00000ff),
          ),
        ),
      ),
    );
  }
}
