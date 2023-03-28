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
      borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
    )
  ),
''';

class BorderRadiusDirectionalAllScreen extends ConsumerWidget {
  const BorderRadiusDirectionalAllScreen({super.key});

  static const routeName = 'painting/BorderRadiusDirectional.all';
  static const title = 'BorderRadiusDirectional.all';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '创建四角统一的半径',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileRadius(
          value: state.radius,
          onSelectedItemChanged: notifier.setRadius,
        ),
      ],
      seeAlso: const [
        BorderRadiusDirectionalCircularScreen.routeName,
        BorderRadiusDirectionalHorizontalScreen.routeName,
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
          borderRadius: BorderRadiusDirectional.all(state.radius),
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
    required this.radius,
  });

  final Radius radius;

  _Props.initial() : radius = Radius.zero;

  _Props initial() => _Props.initial();

  _Props copyWith({
    Radius? radius,
  }) {
    return _Props(
      radius: radius ?? this.radius,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setRadius(Radius value) {
    state = state.copyWith(radius: value);
  }
}
