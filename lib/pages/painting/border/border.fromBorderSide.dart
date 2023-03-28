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
      border: Border.fromBorderSide(
        BorderSide()
      ),
    ),
  ),
  ...
''';

class BorderFromBorderSideScreen extends ConsumerWidget {
  const BorderFromBorderSideScreen({super.key});

  static const routeName = 'painting/Border.fromBorderSide';
  static const title = 'Border.fromBorderSide';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '通过 BorderSide 统一设置四边边框',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileBorderSide(
          value: state.side,
          onSelectedItemChanged: notifier.setSide,
        ),
      ],
      seeAlso: const [
        BorderScreen.routeName,
        BorderAllScreen.routeName,
        BorderSymmetricScreen.routeName,
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
          border: Border.fromBorderSide(state.side),
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
    required this.side,
  });

  final BorderSide side;

  _Props.initial() : side = BorderSide.none;

  _Props initial() => _Props.initial();

  _Props copyWith({
    BorderSide? side,
  }) {
    return _Props(
      side: side ?? this.side,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setSide(BorderSide value) {
    state = state.copyWith(side: value);
  }
}
