import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  BorderRadiusDirectional.all(Radius radius)

  Container(
    width: 100,
    height: 50,
    decoration: BoxDecoration(
      color: CupertinoColors.activeBlue,
      borderRadius: BorderRadiusDirectional.only(
        topStart: Radius.circular(10),
        topEnd: Radius.circular(10),
        bottomStart: Radius.circular(10),
        bottomEnd: Radius.circular(10),
      ),
    )
  ),
''';

class BorderRadiusDirectionalOnlyScreen extends ConsumerWidget {
  const BorderRadiusDirectionalOnlyScreen({super.key});

  static const routeName = 'painting/BorderRadiusDirectional.only';
  static const title = 'BorderRadiusDirectional.only';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '创建单独角的四角的半径',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileRadius(
          name: 'topStart',
          description: '阅读开始方向上角半径',
          value: state.topStart,
          onSelectedItemChanged: notifier.setTopStart,
        ),
        ListTileRadius(
          name: 'topEnd',
          description: '阅读结束方向上角半径',
          value: state.topEnd,
          onSelectedItemChanged: notifier.setTopEnd,
        ),
        ListTileRadius(
          name: 'bottomStart',
          description: '阅读开始方向下角半径',
          value: state.bottomStart,
          onSelectedItemChanged: notifier.setBottomStart,
        ),
        ListTileRadius(
          name: 'bottomEnd',
          description: '阅读结束方向下角半径',
          value: state.bottomEnd,
          onSelectedItemChanged: notifier.setBottomEnd,
        ),
      ],
      seeAlso: const [
        BorderRadiusDirectionalAllScreen.routeName,
        BorderRadiusDirectionalCircularScreen.routeName,
        BorderRadiusDirectionalHorizontalScreen.routeName,
        BorderRadiusDirectionalVerticalScreen.routeName,
      ],
    );
  }
}

class _Sample extends StatefulWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  State<_Sample> createState() => _SampleState();
}

class _SampleState extends State<_Sample> {
  @override
  Widget build(BuildContext context) {
    final state = widget.state;

    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          color: CupertinoColors.activeBlue,
          borderRadius: BorderRadiusDirectional.only(
            topStart: state.topStart,
            topEnd: state.topEnd,
            bottomStart: state.bottomStart,
            bottomEnd: state.bottomEnd,
          ),
        ),
      ),
    );
  }
}

final _stateProvider = StateNotifierProvider<_State, _Props>((ref) {
  return _State();
});

class _Props {
  _Props({
    required this.topStart,
    required this.topEnd,
    required this.bottomStart,
    required this.bottomEnd,
  });

  final Radius topStart;
  final Radius topEnd;
  final Radius bottomStart;
  final Radius bottomEnd;

  _Props.initial()
      : topStart = Radius.zero,
        topEnd = Radius.zero,
        bottomStart = Radius.zero,
        bottomEnd = Radius.zero;

  _Props initial() => _Props.initial();

  _Props copyWith({
    Radius? topStart,
    Radius? topEnd,
    Radius? bottomStart,
    Radius? bottomEnd,
  }) {
    return _Props(
      topStart: topStart ?? this.topStart,
      topEnd: topEnd ?? this.topEnd,
      bottomStart: bottomStart ?? this.bottomStart,
      bottomEnd: bottomEnd ?? this.bottomEnd,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setTopStart(Radius value) {
    state = state.copyWith(topStart: value);
  }

  void setTopEnd(Radius value) {
    state = state.copyWith(topEnd: value);
  }

  void setBottomStart(Radius value) {
    state = state.copyWith(bottomStart: value);
  }

  void setBottomEnd(Radius value) {
    state = state.copyWith(bottomEnd: value);
  }
}
