import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  AnimatedAlign(
    alignment: _alignment,
    duration: const Duration(seconds: 1),
    curve: Curves.bounceOut,
    child: const FlutterLogo(size: 50),
  ),
  ...
''';

class AnimatedAlignScreen extends ConsumerWidget {
  const AnimatedAlignScreen({super.key});

  static const routeName = 'widgets/AnimatedAlign';
  static const title = 'AnimatedAlign';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: 'Align 的动画版本，每当给定的对齐方式发生变化时，它会在给定的持续时间内'
          '自动转换子部件的位置。',
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
          value: state.widthFactor,
          onChanged: notifier.setWidthFactor,
        ),
        ListTileHeightFactor(
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
          name: 'createState() → AnimatedWidgetBaseState<AnimatedAlign>',
        ),
        ListTile(
          name:
              'debugFillProperties(DiagnosticPropertiesBuilder properties) → void',
        ),
      ],
      seeAlso: const [
        AnimatedContainerScreen.routeName,
        AnimatedPaddingScreen.routeName,
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
      alignment: Alignment.center,
      height: 150,
      child: Container(
        color: CupertinoColors.activeGreen,
        child: AnimatedAlign(
          alignment: state.alignment,
          duration: state.duration,
          curve: state.curve,
          widthFactor: state.widthFactor,
          heightFactor: state.heightFactor,
          child: Container(
            width: 50,
            height: 50,
            color: const Color(0xa00000ff),
          ),
        ),
      ),
    );
  }
}
