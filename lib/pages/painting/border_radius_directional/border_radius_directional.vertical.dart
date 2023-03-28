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
      borderRadius: BorderRadiusDirectional.vertical(
        top: Radius.circular(10),
        bottom: Radius.circular(10),
      ),
    )
  ),
''';

class BorderRadiusDirectionalVerticalScreen extends ConsumerWidget {
  const BorderRadiusDirectionalVerticalScreen({super.key});

  static const routeName = 'painting/BorderRadiusDirectional.vertical';
  static const title = 'BorderRadiusDirectional.vertical';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '创建垂直对称的半径',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileRadius(
          name: 'top',
          description: '上边两角半径',
          value: state.top,
          onSelectedItemChanged: notifier.setTop,
        ),
        ListTileRadius(
          name: 'bottom',
          description: '下边两角半径',
          value: state.bottom,
          onSelectedItemChanged: notifier.setBottom,
        ),
      ],
      seeAlso: const [
        BorderRadiusDirectionalAllScreen.routeName,
        BorderRadiusDirectionalCircularScreen.routeName,
        BorderRadiusDirectionalHorizontalScreen.routeName,
        BorderRadiusDirectionalOnlyScreen.routeName,
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
          borderRadius: BorderRadiusDirectional.vertical(
            top: state.top,
            bottom: state.bottom,
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
    required this.top,
    required this.bottom,
  });

  final Radius top;
  final Radius bottom;

  _Props.initial()
      : top = Radius.zero,
        bottom = Radius.zero;

  _Props initial() => _Props.initial();

  _Props copyWith({
    Radius? top,
    Radius? bottom,
  }) {
    return _Props(
      top: top ?? this.top,
      bottom: bottom ?? this.bottom,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setTop(Radius value) {
    state = state.copyWith(top: value);
  }

  void setBottom(Radius value) {
    state = state.copyWith(bottom: value);
  }
}
