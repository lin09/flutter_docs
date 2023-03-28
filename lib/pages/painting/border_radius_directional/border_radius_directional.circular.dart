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
      borderRadius: BorderRadiusDirectional.circular(10),
    )
  ),
''';

class BorderRadiusDirectionalCircularScreen extends ConsumerWidget {
  const BorderRadiusDirectionalCircularScreen({super.key});

  static const routeName = 'painting/BorderRadiusDirectional.circular';
  static const title = 'BorderRadiusDirectional.circular';

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
        ListTileDouble(
          name: 'radius',
          description: '半径值',
          value: state.radius,
          onChanged: notifier.setRadius,
        ),
      ],
      seeAlso: const [
        BorderRadiusDirectionalAllScreen.routeName,
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
          borderRadius: BorderRadiusDirectional.circular(state.radius),
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

  final double radius;

  _Props.initial() : radius = 10;

  _Props initial() => _Props.initial();

  _Props copyWith({
    double? radius,
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

  void setRadius(double value) {
    state = state.copyWith(radius: value);
  }
}
