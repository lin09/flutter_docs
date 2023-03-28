import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  AnimatedPadding(
    padding: state.padding,
    duration: state.duration,
    curve: state.curve,
    ...
  ),
  ...
''';

class AnimatedPaddingScreen extends ConsumerWidget {
  const AnimatedPaddingScreen({super.key});

  static const routeName = 'widgets/AnimatedPadding';
  static const title = 'AnimatedPadding';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '动画版本的 Padding',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTilePadding(
          value: state.padding,
          onSelectedItemChanged: notifier.setPadding,
        ),
        ListTileCurve(
          value: state.curve,
          onSelectedItemChanged: notifier.setCurve,
        ),
        ListTileDuration(
          value: state.duration,
          onSelectedItemChanged: notifier.setDuration,
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
          name: 'child → Widget?',
        ),
        ListTile(
          name: 'padding → EdgeInsetsGeometry',
        ),
      ],
      methods: const [
        ListTile(
          name: 'createState() → AnimatedWidgetBaseState<AnimatedPadding>',
        ),
        ListTile(
          name:
              'debugFillProperties(DiagnosticPropertiesBuilder properties) → void',
        ),
      ],
      seeAlso: const [
        AnimatedContainerScreen.routeName,
        AnimatedAlignScreen.routeName,
      ],
    );
  }
}

final _stateProvider = StateNotifierProvider<_State, _Props>((ref) {
  return _State();
});

class _Props {
  _Props({
    required this.padding,
    required this.duration,
    this.curve = Curves.linear,
  });

  final EdgeInsetsGeometry padding;
  final Duration duration;
  final Curve curve;

  _Props.initial()
      : padding = EdgeInsets.zero,
        duration = const Duration(seconds: 2),
        curve = Curves.linear;

  _Props initial() => _Props.initial();

  _Props copyWith({
    EdgeInsetsGeometry? padding,
    Duration? duration,
    Curve? curve,
  }) {
    return _Props(
      padding: padding ?? this.padding,
      duration: duration ?? this.duration,
      curve: curve ?? this.curve,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setPadding(EdgeInsetsGeometry value) {
    state = state.copyWith(padding: value);
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
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      height: 120,
      child: Container(
        color: CupertinoColors.activeOrange,
        child: AnimatedPadding(
          padding: state.padding,
          duration: state.duration,
          curve: state.curve,
          child: Container(
            color: CupertinoColors.activeBlue,
            width: 50,
            height: 50,
          ),
        ),
      ),
    );
  }
}
