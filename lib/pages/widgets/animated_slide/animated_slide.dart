import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  AnimatedSlide(
    duration: state.duration,
    curve: state.curve,
    ...
  ),
  ...
''';

class AnimatedSlideScreen extends ConsumerWidget {
  const AnimatedSlideScreen({super.key});

  static const routeName = 'widgets/AnimatedSlide';
  static const title = 'AnimatedSlide';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '当给定的偏移发生变化时，会在给定的持续时间内自动转换位置。',
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
        ListTileOffset(
          value: state.offset,
          onSelectedItemChanged: notifier.setOffset,
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
          name: 'offset → Offset',
        ),
      ],
      methods: const [
        ListTile(
          name: 'createState() → ImplicitlyAnimatedWidgetState<AnimatedSlide>',
        ),
        ListTile(
          name:
              'debugFillProperties(DiagnosticPropertiesBuilder properties) → void',
        ),
      ],
      seeAlso: const [
        AnimatedPositionedScreen.routeName,
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
    required this.duration,
    this.curve = Curves.linear,
    required this.offset,
  });

  final Duration duration;
  final Curve curve;
  final Offset offset;

  _Props.initial()
      : curve = Curves.linear,
        duration = const Duration(seconds: 1),
        offset = const Offset(0, 0);

  _Props initial() => _Props.initial();

  _Props copyWith({
    Duration? duration,
    Curve? curve,
    Offset? offset,
  }) {
    return _Props(
      duration: duration ?? this.duration,
      curve: curve ?? this.curve,
      offset: offset ?? this.offset,
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

  void setOffset(Offset value) {
    state = state.copyWith(offset: value);
  }
}

class _Sample extends StatelessWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 130,
      child: Container(
        width: 40,
        height: 40,
        color: CupertinoColors.activeOrange,
        child: AnimatedSlide(
          duration: state.duration,
          curve: state.curve,
          offset: state.offset,
          child: Container(color: CupertinoColors.activeBlue),
        ),
      ),
    );
  }
}
