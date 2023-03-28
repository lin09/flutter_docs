import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  AnimatedCrossFade(
    firstChild: const Text('firstChild'),
    secondChild: const Text('secondChild'),
    crossFadeState: _first
        ? CrossFadeState.showFirst
        : CrossFadeState.showSecond,
    duration: const Duration(seconds: 1),
  ),
  ...
''';

class AnimatedCrossFadeScreen extends ConsumerWidget {
  const AnimatedCrossFadeScreen({super.key});

  static const routeName = 'widgets/AnimatedCrossFade';
  static const title = 'AnimatedCrossFade';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: 'AnimatedCrossFade 是一个部件，根据设置不同状态来显示两个子部件其中之'
          '一，可设置切换动画和大小不同时动画。',
      code: _code,
      sample: _Sample(state),
      parameters: [
        const ListTileWidget(
          name: 'firstChild',
          description: '第一个子部件',
        ),
        const ListTileWidget(
          name: 'secondChild',
          description: '第二个子部件',
        ),
        ListTilePicker<CrossFadeState>(
          name: 'crossFadeState',
          description: '显示哪个子部件',
          items: [
            ListTilePickerItem(
              text: 'CrossFadeState.showFirst',
              value: CrossFadeState.showFirst,
            ),
            ListTilePickerItem(
              text: 'CrossFadeState.showSecond',
              value: CrossFadeState.showSecond,
            ),
          ],
          value: state.crossFadeState,
          onSelectedItemChanged: notifier.setCrossFadeState,
        ),
        ListTileCurve(
          name: 'firstCurve',
          value: state.firstCurve,
          description: '第一个子部件动画曲线',
          onSelectedItemChanged: notifier.setFirstCurve,
        ),
        ListTileCurve(
          name: 'secondCurve',
          value: state.secondCurve,
          description: '第二个子部件动画曲线',
          onSelectedItemChanged: notifier.setSecondCurve,
        ),
        ListTileCurve(
          name: 'sizeCurve',
          value: state.sizeCurve,
          description: '大小变化动画曲线',
          onSelectedItemChanged: notifier.setSizeCurve,
        ),
        ListTileAlignment(
          value: state.alignment,
          onSelectedItemChanged: notifier.setAlignment,
        ),
        ListTileDuration(
          value: state.duration,
          onSelectedItemChanged: notifier.setDuration,
        ),
        ListTileDuration(
          name: 'reverseDuration',
          description: '从第二个反回第一个的持续时间',
          value: state.reverseDuration,
          onSelectedItemChanged: notifier.setReverseDuration,
        ),
        const ListTile(
          name: 'layoutBuilder',
          description: '自定义布局。',
          type: 'AnimatedCrossFadeBuilder',
          // TODO:
        ),
        ListTileSwitch(
          name: 'excludeBottomFocus',
          description: '(没理解)',
          value: state.excludeBottomFocus,
          onChanged: notifier.setExcludeBottomFocus,
        ),
      ],
      inheritance: StatefulWidgetScreen.routeName,
      properties: const [
        ListTile(
          name: 'alignment → AlignmentGeometry',
        ),
        ListTile(
          name: 'crossFadeState → CrossFadeState',
        ),
        ListTile(
          name: 'duration → Duration',
        ),
        ListTile(
          name: 'excludeBottomFocus → bool',
        ),
        ListTile(
          name: 'firstChild → Widget',
        ),
        ListTile(
          name: 'firstCurve → Curve',
        ),
        ListTile(
          name: 'layoutBuilder → AnimatedCrossFadeBuilder',
        ),
        ListTile(
          name: 'reverseDuration → Duration?',
        ),
        ListTile(
          name: 'secondChild → Widget',
        ),
        ListTile(
          name: 'secondCurve → Curve',
        ),
        ListTile(
          name: 'sizeCurve → Curve',
        ),
      ],
      methods: const [
        ListTile(
          name: 'createState() → State<AnimatedCrossFade>',
        ),
        ListTile(
          name:
              'debugFillProperties(DiagnosticPropertiesBuilder properties) → void',
        ),
      ],
      staticMethods: const [
        ListTile(
          name:
              'defaultLayoutBuilder(Widget topChild, Key topChildKey, Widget bottomChild, Key bottomChildKey) → Widget',
        ),
      ],
      seeAlso: const [
        AnimatedOpacityScreen.routeName,
        AnimatedSwitcherScreen.routeName,
        AnimatedSizeScreen.routeName,
      ],
    );
  }
}

final _stateProvider = StateNotifierProvider<_State, _Props>((ref) {
  return _State();
});

class _Props {
  _Props({
    required this.crossFadeState,
    required this.firstCurve,
    required this.secondCurve,
    required this.sizeCurve,
    required this.alignment,
    required this.duration,
    this.reverseDuration,
    required this.excludeBottomFocus,
  });

  final CrossFadeState crossFadeState;
  final Curve firstCurve;
  final Curve secondCurve;
  final Curve sizeCurve;
  final AlignmentGeometry alignment;
  final Duration duration;
  final Duration? reverseDuration;
  final bool excludeBottomFocus;

  _Props.initial()
      : crossFadeState = CrossFadeState.showFirst,
        firstCurve = Curves.linear,
        secondCurve = Curves.linear,
        sizeCurve = Curves.linear,
        alignment = Alignment.topCenter,
        duration = const Duration(seconds: 2),
        reverseDuration = null,
        excludeBottomFocus = true;

  _Props initial() => _Props.initial();

  _Props copyWith({
    CrossFadeState? crossFadeState,
    Curve? firstCurve,
    Curve? secondCurve,
    Curve? sizeCurve,
    AlignmentGeometry? alignment,
    Duration? duration,
    Duration? reverseDuration,
    bool? excludeBottomFocus,
  }) {
    return _Props(
      crossFadeState: crossFadeState ?? this.crossFadeState,
      firstCurve: firstCurve ?? this.firstCurve,
      secondCurve: secondCurve ?? this.secondCurve,
      sizeCurve: sizeCurve ?? this.sizeCurve,
      alignment: alignment ?? this.alignment,
      duration: duration ?? this.duration,
      reverseDuration: reverseDuration ?? this.reverseDuration,
      excludeBottomFocus: excludeBottomFocus ?? this.excludeBottomFocus,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setCrossFadeState(CrossFadeState value) {
    state = state.copyWith(crossFadeState: value);
  }

  void setFirstCurve(Curve value) {
    state = state.copyWith(firstCurve: value);
  }

  void setSecondCurve(Curve value) {
    state = state.copyWith(secondCurve: value);
  }

  void setSizeCurve(Curve value) {
    state = state.copyWith(sizeCurve: value);
  }

  void setAlignment(AlignmentGeometry value) {
    state = state.copyWith(alignment: value);
  }

  void setDuration(Duration value) {
    state = state.copyWith(duration: value);
  }

  void setReverseDuration(Duration? value) {
    state = state.copyWith(reverseDuration: value);
  }

  void setExcludeBottomFocus(bool value) {
    state = state.copyWith(excludeBottomFocus: value);
  }
}

class _Sample extends StatelessWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      alignment: state.alignment,
      padding: const EdgeInsets.all(8.0),
      child: AnimatedCrossFade(
        firstChild: Container(
          width: 50,
          height: 100,
          color: CupertinoColors.activeBlue,
        ),
        secondChild: Container(
          width: 100,
          height: 20,
          color: CupertinoColors.activeGreen,
        ),
        crossFadeState: state.crossFadeState,
        duration: state.duration,
        reverseDuration: state.reverseDuration,
        firstCurve: state.firstCurve,
        secondCurve: state.secondCurve,
        sizeCurve: state.sizeCurve,
        alignment: state.alignment,
        excludeBottomFocus: state.excludeBottomFocus,
      ),
    );
  }
}
