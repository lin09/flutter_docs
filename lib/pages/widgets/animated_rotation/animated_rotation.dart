import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  AnimatedRotation(
    duration: state.duration,
    curve: state.curve,
    ...
  ),
  ...
''';

class AnimatedRotationScreen extends ConsumerWidget {
  const AnimatedRotationScreen({super.key});

  static const routeName = 'widgets/AnimatedRotation';
  static const title = 'AnimatedRotation';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '动画版本 Transform.rotate',
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
          name: 'turns',
          description: '旋转的圈数',
          value: state.turns,
          step: 0.25,
          min: double.negativeInfinity,
          onChanged: notifier.setTurns,
        ),
        ListTileAlignment(
          value: state.alignment,
          onSelectedItemChanged: notifier.setAlignment,
        ),
        ListTileFilterQuality(
          value: state.filterQuality,
          onSelectedItemChanged: notifier.setFilterQuality,
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
          name: 'alignment → Alignment',
        ),
        ListTile(
          name: 'child → Widget?',
        ),
        ListTile(
          name: 'filterQuality → FilterQuality?',
        ),
        ListTile(
          name: 'turns → double',
        ),
      ],
      methods: const [
        ListTile(
          name:
              'createState() → ImplicitlyAnimatedWidgetState<AnimatedRotation>',
        ),
        ListTile(
          name:
              'debugFillProperties(DiagnosticPropertiesBuilder properties) → void',
        ),
      ],
      seeAlso: const [
        AnimatedScaleScreen.routeName,
        RotationTransitionScreen.routeName,
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
    this.alignment = Alignment.center,
    required this.turns,
    this.filterQuality,
  });

  final Duration duration;
  final Curve curve;
  final Alignment alignment;
  final double turns;
  final FilterQuality? filterQuality;

  _Props.initial()
      : curve = Curves.linear,
        duration = const Duration(seconds: 1),
        alignment = Alignment.center,
        turns = 0,
        filterQuality = null;

  _Props initial() => _Props.initial();

  _Props copyWith({
    Duration? duration,
    Curve? curve,
    Alignment? alignment,
    double? turns,
    FilterQuality? filterQuality,
  }) {
    return _Props(
      duration: duration ?? this.duration,
      curve: curve ?? this.curve,
      alignment: alignment ?? this.alignment,
      turns: turns ?? this.turns,
      filterQuality: filterQuality ?? this.filterQuality,
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

  void setAlignment(value) {
    state = state.copyWith(alignment: value);
  }

  void setTurns(value) {
    state = state.copyWith(turns: value);
  }

  void setFilterQuality(value) {
    state = state.copyWith(filterQuality: value);
  }
}

class _Sample extends StatelessWidget {
  const _Sample(this.state);

  final _Props state;

  Container _square(Color color) => Container(
        width: 15,
        height: 15,
        color: color,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 80,
      child: Container(
        alignment: Alignment.center,
        width: 60,
        height: 60,
        color: CupertinoColors.activeOrange,
        child: AnimatedRotation(
          alignment: state.alignment,
          turns: state.turns,
          filterQuality: state.filterQuality,
          duration: state.duration,
          curve: state.curve,
          child: SizedBox(
            width: 30,
            height: 30,
            child: Column(
              children: [
                Row(
                  children: [
                    _square(CupertinoColors.systemBlue),
                    _square(CupertinoColors.systemRed),
                  ],
                ),
                Row(
                  children: [
                    _square(CupertinoColors.systemGreen),
                    _square(CupertinoColors.systemPurple),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
