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
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
    )
  ),
''';

class BorderRadiusOnlyScreen extends ConsumerWidget {
  const BorderRadiusOnlyScreen({super.key});

  static const routeName = 'painting/BorderRadius.only';
  static const title = 'BorderRadius.only';

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
          name: 'topLeft',
          description: '左上角半径',
          value: state.topLeft,
          onSelectedItemChanged: notifier.setTopLeft,
        ),
        ListTileRadius(
          name: 'topRight',
          description: '右上角半径',
          value: state.topRight,
          onSelectedItemChanged: notifier.setTopRight,
        ),
        ListTileRadius(
          name: 'bottomLeft',
          description: '左下角半径',
          value: state.bottomLeft,
          onSelectedItemChanged: notifier.setBottomLeft,
        ),
        ListTileRadius(
          name: 'bottomRight',
          description: '右下角半径',
          value: state.bottomRight,
          onSelectedItemChanged: notifier.setBottomRight,
        ),
      ],
      seeAlso: const [
        BorderRadiusAllScreen.routeName,
        BorderRadiusCircularScreen.routeName,
        BorderRadiusHorizontalScreen.routeName,
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
          borderRadius: BorderRadius.only(
            topLeft: state.topLeft,
            topRight: state.topRight,
            bottomLeft: state.bottomLeft,
            bottomRight: state.bottomRight,
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
    required this.topLeft,
    required this.topRight,
    required this.bottomLeft,
    required this.bottomRight,
  });

  final Radius topLeft;
  final Radius topRight;
  final Radius bottomLeft;
  final Radius bottomRight;

  _Props.initial()
      : topLeft = Radius.zero,
        topRight = Radius.zero,
        bottomLeft = Radius.zero,
        bottomRight = Radius.zero;

  _Props initial() => _Props.initial();

  _Props copyWith({
    Radius? topLeft,
    Radius? topRight,
    Radius? bottomLeft,
    Radius? bottomRight,
  }) {
    return _Props(
      topLeft: topLeft ?? this.topLeft,
      topRight: topRight ?? this.topRight,
      bottomLeft: bottomLeft ?? this.bottomLeft,
      bottomRight: bottomRight ?? this.bottomRight,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setTopLeft(Radius value) {
    state = state.copyWith(topLeft: value);
  }

  void setTopRight(Radius value) {
    state = state.copyWith(topRight: value);
  }

  void setBottomLeft(Radius value) {
    state = state.copyWith(bottomLeft: value);
  }

  void setBottomRight(Radius value) {
    state = state.copyWith(bottomRight: value);
  }
}
