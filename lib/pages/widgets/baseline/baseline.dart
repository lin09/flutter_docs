import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  Baseline({
    Key? key,
    required double baseline,
    required TextBaseline baselineType,
    Widget? child，
  })
''';

class BaselineScreen extends ConsumerWidget {
  const BaselineScreen({super.key});

  static const routeName = 'widgets/Baseline';
  static const title = 'Baseline';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '设置基线来定位子部件位置',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileDouble(
          name: 'baseline',
          description: '从该框顶部开始定位子部件基线的逻辑像素数。',
          max: 150,
          min: 70,
          step: 10,
          value: state.baseline,
          onChanged: notifier.setBaseline,
        ),
        ListTileTextBaseline(
          value: state.baselineType,
          onSelectedItemChanged: notifier.setBaselineType,
        ),
        const ListTileChild(),
      ],
      inheritance: SingleChildRenderObjectWidgetScreen.routeName,
      properties: const [
        ListTile(
          name: 'baseline → double',
        ),
        ListTile(
          name: 'baselineType → TextBaseline',
        ),
      ],
      methods: const [
        ListTile(
          name: 'createRenderObject(BuildContext context) → RenderBaseline',
        ),
        ListTile(
          name:
              'updateRenderObject(BuildContext context, covariant RenderBaseline renderObject) → void',
        ),
      ],
      seeAlso: const [
        AlignScreen.routeName,
        CenterScreen.routeName,
      ],
    );
  }
}

class _Sample extends StatelessWidget {
  const _Sample(this.state);

  final _Props state;

  Widget _baseline(Widget child) => Baseline(
        baseline: state.baseline,
        baselineType: state.baselineType,
        child: child,
      );

  Widget _baselineText(double fontSize) => _baseline(Text(
        'text',
        style: TextStyle(
          backgroundColor: CupertinoColors.activeBlue,
          fontSize: fontSize,
        ),
      ));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _baselineText(14),
          SizedBox(
            height: state.baseline,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(CupertinoIcons.arrow_up),
                Text('${state.baseline}'),
                Column(
                  children: [
                    const Icon(CupertinoIcons.arrow_down),
                    Container(
                      height: 1,
                      width: 50,
                      color: CupertinoColors.activeBlue,
                    ),
                  ],
                ),
              ],
            ),
          ),
          _baselineText(30),
          _baseline(Container(
            width: 50,
            height: 80,
            color: CupertinoColors.activeBlue,
          )),
          _baseline(Container(
            width: 50,
            height: 80,
            color: CupertinoColors.activeBlue,
            child: const Text('text'),
          )),
          _baseline(Container(
            alignment: Alignment.center,
            width: 50,
            height: 80,
            color: CupertinoColors.activeBlue,
            child: const Text('text'),
          )),
        ],
      ),
    );
  }
}

final _stateProvider = StateNotifierProvider<_State, _Props>((ref) {
  return _State();
});

class _Props {
  _Props({
    required this.baseline,
    required this.baselineType,
  });

  final double baseline;
  final TextBaseline baselineType;

  _Props.initial()
      : baseline = 100,
        baselineType = TextBaseline.alphabetic;

  _Props initial() => _Props.initial();

  _Props copyWith({
    double? baseline,
    TextBaseline? baselineType,
  }) {
    return _Props(
      baseline: baseline ?? this.baseline,
      baselineType: baselineType ?? this.baselineType,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setBaseline(double value) {
    state = state.copyWith(baseline: value);
  }

  void setBaselineType(TextBaseline value) {
    state = state.copyWith(baselineType: value);
  }
}
