import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  Container(
    alignment: Alignment.center,
    width: 100,
    height: 100,
    child: AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: CupertinoColors.activeBlue,
      ),
    ),
  ),
''';

class AspectRatioScreen extends ConsumerWidget {
  const AspectRatioScreen({super.key});

  static const routeName = 'widgets/AspectRatio';
  static const title = 'AspectRatio';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '根据布局约束和设置宽高比来约束子部件宽高。',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileDouble(
          name: 'aspectRatio',
          description: '宽高比，大于 0',
          min: 0.01,
          step: 0.33,
          value: state.aspectRatio,
          onChanged: notifier.setAspectRatio,
        ),
        const ListTileChild(),
      ],
      inheritance: SingleChildRenderObjectWidgetScreen.routeName,
      properties: const [
        ListTile(
          name: 'aspectRatio → double',
        ),
      ],
      methods: const [
        ListTile(
          name: 'createRenderObject(BuildContext context) → RenderAspectRatio',
        ),
        ListTile(
          name:
              'debugFillProperties(DiagnosticPropertiesBuilder properties) → void',
        ),
        ListTile(
          name:
              'updateRenderObject(BuildContext context, covariant RenderAspectRatio renderObject) → void',
        ),
      ],
      seeAlso: const [
        AlignScreen.routeName,
        ConstrainedBoxScreen.routeName,
        UnconstrainedBoxScreen.routeName,
      ],
    );
  }
}

final _stateProvider = StateNotifierProvider<_State, _Props>((ref) {
  return _State();
});

class _Props {
  _Props({
    this.aspectRatio = 2,
  });

  final double aspectRatio;

  _Props.initial() : aspectRatio = 2;

  _Props initial() => _Props.initial();

  _Props copyWith({
    double? aspectRatio,
  }) {
    return _Props(
      aspectRatio: aspectRatio ?? this.aspectRatio,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setAspectRatio(double value) {
    state = state.copyWith(aspectRatio: value);
  }
}

class _Sample extends StatelessWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 100,
        color: CupertinoColors.activeOrange,
        child: AspectRatio(
          aspectRatio: state.aspectRatio,
          child: Container(
            color: CupertinoColors.activeBlue,
          ),
        ),
      ),
    );
  }
}
