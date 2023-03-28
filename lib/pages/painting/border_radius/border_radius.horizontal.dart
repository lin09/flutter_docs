import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  BorderRadius.all(Radius radius)

  Container(
    width: 100,
    height: 50,
    decoration: BoxDecoration(
      color: CupertinoColors.activeBlue,
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(10),
        right: Radius.circular(10),
      ),
    )
  ),
''';

class BorderRadiusHorizontalScreen extends ConsumerWidget {
  const BorderRadiusHorizontalScreen({super.key});

  static const routeName = 'painting/BorderRadius.horizontal';
  static const title = 'BorderRadius.horizontal';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '创建水平对称的半径',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileRadius(
          name: 'left',
          description: '左边两角半径',
          value: state.left,
          onSelectedItemChanged: notifier.setLeft,
        ),
        ListTileRadius(
          name: 'right',
          description: '右边两角半径',
          value: state.right,
          onSelectedItemChanged: notifier.setRight,
        ),
      ],
      seeAlso: const [
        BorderRadiusAllScreen.routeName,
        BorderRadiusCircularScreen.routeName,
        BorderRadiusOnlyScreen.routeName,
        BorderRadiusVerticalScreen.routeName,
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
          borderRadius: BorderRadius.horizontal(
            left: state.left,
            right: state.right,
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
    required this.left,
    required this.right,
  });

  final Radius left;
  final Radius right;

  _Props.initial()
      : left = Radius.zero,
        right = Radius.zero;

  _Props initial() => _Props.initial();

  _Props copyWith({
    Radius? left,
    Radius? right,
  }) {
    return _Props(
      left: left ?? this.left,
      right: right ?? this.right,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setLeft(Radius value) {
    state = state.copyWith(left: value);
  }

  void setRight(Radius value) {
    state = state.copyWith(right: value);
  }
}
