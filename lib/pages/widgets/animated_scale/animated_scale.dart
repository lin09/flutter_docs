import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  AnimatedScale(
    duration: state.duration,
    curve: state.curve,
    ...
  ),
  ...
''';

class AnimatedScaleScreen extends ConsumerWidget {
  const AnimatedScaleScreen({super.key});

  static const routeName = 'widgets/AnimatedScale';
  static const title = 'AnimatedScale';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '动画版本 Transform.scale',
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
          name: 'scale',
          description: '旋转的圈数',
          value: state.scale,
          min: double.negativeInfinity,
          onChanged: notifier.setScale,
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
          name: 'scale → double',
        ),
      ],
      methods: const [
        ListTile(
          name: 'createState() → ImplicitlyAnimatedWidgetState<AnimatedScale>',
        ),
        ListTile(
          name:
              'debugFillProperties(DiagnosticPropertiesBuilder properties) → void',
        ),
      ],
      seeAlso: const [
        AnimatedRotationScreen.routeName,
        AnimatedSizeScreen.routeName,
        AnimatedSlideScreen.routeName,
        ScaleTransitionScreen.routeName,
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
    required this.scale,
    this.filterQuality,
  });

  final Duration duration;
  final Curve curve;
  final Alignment alignment;
  final double scale;
  final FilterQuality? filterQuality;

  _Props.initial()
      : curve = Curves.linear,
        duration = const Duration(seconds: 1),
        alignment = Alignment.center,
        scale = 1,
        filterQuality = null;

  _Props initial() => _Props.initial();

  _Props copyWith({
    Duration? duration,
    Curve? curve,
    Alignment? alignment,
    double? scale,
    FilterQuality? filterQuality,
  }) {
    return _Props(
      duration: duration ?? this.duration,
      curve: curve ?? this.curve,
      alignment: alignment ?? this.alignment,
      scale: scale ?? this.scale,
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

  void setScale(value) {
    state = state.copyWith(scale: value);
  }

  void setFilterQuality(value) {
    state = state.copyWith(filterQuality: value);
  }
}

class _Sample extends StatelessWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 80,
      child: AnimatedScale(
        alignment: state.alignment,
        scale: state.scale,
        filterQuality: state.filterQuality,
        duration: state.duration,
        curve: state.curve,
        child: Container(
          width: 20,
          height: 4,
          color: CupertinoColors.activeBlue,
        ),
      ),
    );
  }
}
