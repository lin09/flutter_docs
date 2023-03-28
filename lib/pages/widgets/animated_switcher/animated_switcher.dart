import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  AnimatedSwitcher(
    duration: state.duration,
    switchInCurve: state.switchInCurve,
    child: Text(
      '\$_count',
      key: ValueKey<int>(_count),
    ),
    ...
  ),
  ...
''';

class AnimatedSwitcherScreen extends ConsumerWidget {
  const AnimatedSwitcherScreen({super.key});

  static const routeName = 'widgets/AnimatedSwitcher';
  static const title = 'AnimatedSwitcher';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: 'AnimatedSwitcher 的 child 替换时，将进行动画替换。',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileCurve(
          name: 'switchInCurve',
          description: '入场动画',
          value: state.switchInCurve,
          onSelectedItemChanged: notifier.setSwitchInCurve,
        ),
        ListTileCurve(
          name: 'switchOutCurve',
          description: '退场动画',
          value: state.switchOutCurve,
          onSelectedItemChanged: notifier.setSwitchOutCurve,
        ),
        ListTileDuration(
          value: state.duration,
          onSelectedItemChanged: notifier.setDuration,
        ),
        ListTileDuration(
          name: 'reverseDuration',
          value: state.reverseDuration,
          onSelectedItemChanged: notifier.setReverseDuration,
        ),
        const ListTile(
          name: 'transitionBuilder',
          description: '自定义动画',
          type: 'AnimatedSwitcherTransitionBuilder',
          typeWidth: 220,
        ),
        const ListTile(
          name: 'layoutBuilder',
          description: '自定义布局',
          type: 'AnimatedSwitcherLayoutBuilder',
          typeWidth: 200,
        ),
        const ListTile(
          name: 'onEnd',
          description: '动画结束的回调',
          type: 'void Function()',
        ),
      ],
      inheritance: StatefulWidgetScreen.routeName,
      properties: const [
        ListTile(
          name: 'child → Widget?',
        ),
        ListTile(
          name: 'duration → Duration',
        ),
        ListTile(
          name: 'layoutBuilder → AnimatedSwitcherLayoutBuilder',
        ),
        ListTile(
          name: 'reverseDuration → Duration?',
        ),
        ListTile(
          name: 'switchInCurve → Curve',
        ),
        ListTile(
          name: 'switchOutCurve → Curve',
        ),
        ListTile(
          name: 'transitionBuilder → AnimatedSwitcherTransitionBuilder',
        ),
      ],
      methods: const [
        ListTile(
          name: 'createState() → State<AnimatedSwitcher>',
        ),
        ListTile(
          name:
              'debugFillProperties(DiagnosticPropertiesBuilder properties) → void',
        ),
      ],
      staticMethods: const [
        ListTile(
          name:
              'defaultLayoutBuilder(Widget? currentChild, List<Widget> previousChildren) → Widget',
        ),
        ListTile(
          name:
              'defaultTransitionBuilder(Widget child, Animation<double> animation) → Widget',
        ),
      ],
      seeAlso: const [
        AnimatedCrossFadeScreen.routeName,
        AnimatedOpacityScreen.routeName,
        FadeTransitionScreen.routeName,
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
    this.reverseDuration,
    this.switchInCurve = Curves.linear,
    this.switchOutCurve = Curves.linear,
  });

  final Duration duration;
  final Duration? reverseDuration;
  final Curve switchInCurve;
  final Curve switchOutCurve;

  _Props.initial()
      : switchInCurve = Curves.linear,
        switchOutCurve = Curves.linear,
        reverseDuration = null,
        duration = const Duration(seconds: 1);

  _Props initial() => _Props.initial();

  _Props copyWith({
    Duration? duration,
    Duration? reverseDuration,
    Curve? switchInCurve,
    Curve? switchOutCurve,
  }) {
    return _Props(
      duration: duration ?? this.duration,
      reverseDuration: reverseDuration ?? this.reverseDuration,
      switchInCurve: switchInCurve ?? this.switchInCurve,
      switchOutCurve: switchOutCurve ?? this.switchOutCurve,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setSwitchInCurve(Curve value) {
    state = state.copyWith(switchInCurve: value);
  }

  void setSwitchOutCurve(Curve value) {
    state = state.copyWith(switchOutCurve: value);
  }

  void setDuration(Duration value) {
    state = state.copyWith(duration: value);
  }

  void setReverseDuration(Duration value) {
    state = state.copyWith(reverseDuration: value);
  }
}

class _Sample extends StatefulWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  State<_Sample> createState() => _SampleState();
}

class _SampleState extends State<_Sample> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    final state = widget.state;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          AnimatedSwitcher(
            duration: state.duration,
            switchInCurve: state.switchInCurve,
            switchOutCurve: state.switchOutCurve,
            // transitionBuilder: (child, animation) => ScaleTransition(
            //   scale: animation,
            //   child: child,
            // ),
            child: Text(
              '$_count',
              key: ValueKey<int>(_count),
              style:
                  CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
            ),
          ),
          CupertinoButton.filled(
            child: const Text('+1'),
            onPressed: () => setState(() {
              ++_count;
            }),
          ),
        ],
      ),
    );
  }
}
