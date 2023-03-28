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
      borderRadius: BorderRadiusDirectional.horizontal(
        start: Radius.circular(10),
        end: Radius.circular(10),
      ),
    )
  ),
''';

class BorderRadiusDirectionalHorizontalScreen extends ConsumerWidget {
  const BorderRadiusDirectionalHorizontalScreen({super.key});

  static const routeName = 'painting/BorderRadiusDirectional.horizontal';
  static const title = 'BorderRadiusDirectional.horizontal';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '创建阅读方向对称的半径',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileRadius(
          name: 'start',
          description: '阅读开始方向两角半径',
          value: state.start,
          onSelectedItemChanged: notifier.setStart,
        ),
        ListTileRadius(
          name: 'end',
          description: '阅读结束方两角半径',
          value: state.end,
          onSelectedItemChanged: notifier.setEnd,
        ),
      ],
      seeAlso: const [
        BorderRadiusDirectionalAllScreen.routeName,
        BorderRadiusDirectionalCircularScreen.routeName,
        BorderRadiusDirectionalOnlyScreen.routeName,
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
          borderRadius: BorderRadiusDirectional.horizontal(
            start: state.start,
            end: state.end,
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
    required this.start,
    required this.end,
  });

  final Radius start;
  final Radius end;

  _Props.initial()
      : start = Radius.zero,
        end = Radius.zero;

  _Props initial() => _Props.initial();

  _Props copyWith({
    Radius? start,
    Radius? end,
  }) {
    return _Props(
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setStart(Radius value) {
    state = state.copyWith(start: value);
  }

  void setEnd(Radius value) {
    state = state.copyWith(end: value);
  }
}
