import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  Container(
    height: 50,
    decoration: const BoxDecoration(
      color: CupertinoColors.activeOrange,
      border: Border.symmetric(
        vertical: BorderSide(),
        horizontal: BorderSide(),
      ),
    ),
  ),
  ...
''';

class BorderSymmetricScreen extends ConsumerWidget {
  const BorderSymmetricScreen({super.key});

  static const routeName = 'painting/Border.symmetric';
  static const title = 'Border.symmetric';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '分别设置水平方向的边框和垂直方向的边框。 strokeAlign 要统一',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileBorderSide(
          name: 'vertical',
          description: '水平方向的边框',
          value: state.vertical,
          onSelectedItemChanged: notifier.setVertical,
        ),
        ListTileBorderSide(
          name: 'horizontal',
          description: '垂直方向的边框',
          value: state.horizontal,
          onSelectedItemChanged: notifier.setHorizontal,
        ),
      ],
      seeAlso: const [
        BorderScreen.routeName,
        BorderAllScreen.routeName,
        BorderFromBorderSideScreen.routeName,
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
      padding: const EdgeInsets.all(20),
      color: CupertinoColors.activeGreen,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: CupertinoColors.activeBlue,
          border: Border.symmetric(
            vertical: state.vertical,
            horizontal: state.horizontal,
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
    required this.vertical,
    required this.horizontal,
  });

  final BorderSide vertical;
  final BorderSide horizontal;

  _Props.initial()
      : vertical = BorderSide.none,
        horizontal = BorderSide.none;

  _Props initial() => _Props.initial();

  _Props copyWith({
    BorderSide? vertical,
    BorderSide? horizontal,
  }) {
    return _Props(
      vertical: vertical ?? this.vertical,
      horizontal: horizontal ?? this.horizontal,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setVertical(BorderSide value) {
    state = state.copyWith(vertical: value);
  }

  void setHorizontal(BorderSide value) {
    state = state.copyWith(horizontal: value);
  }
}
