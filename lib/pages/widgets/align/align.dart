import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  Container(
    height: 120,
    color: Colors.blue[50],
    child: const Align(
      alignment: Alignment(-0.5, 0.5),
      child: FlutterLogo(size: 60),
    ),
  ),
''';

class AlignScreen extends ConsumerWidget {
  const AlignScreen({super.key});

  static const routeName = 'widgets/Align';
  static const title = 'Align';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var notifier = ref.read(_stateProvider.notifier);
    var state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: 'Align 是一个对齐部件',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileAlignment(
          value: state.alignment,
          onSelectedItemChanged: notifier.setAlignment,
        ),
        ListTileWidthFactor(
          value: state.widthFactor,
          onChanged: notifier.setWidthFactor,
        ),
        ListTileHeightFactor(
          value: state.heightFactor,
          onChanged: notifier.setHeightFactor,
        ),
        const ListTileChild(),
      ],
      inheritance: SingleChildRenderObjectWidgetScreen.routeName,
      properties: const [
        ListTile(
          name: 'alignment → AlignmentGeometry',
        ),
        ListTile(
          name: 'heightFactor → double?',
        ),
        ListTile(
          name: 'widthFactor → double?',
        ),
      ],
      methods: const [
        ListTile(
          name:
              'createRenderObject(BuildContext context) → RenderPositionedBox',
        ),
        ListTile(
          name:
              'debugFillProperties(DiagnosticPropertiesBuilder properties) → void',
        ),
        ListTile(
          name:
              'updateRenderObject(BuildContext context, covariant RenderPositionedBox renderObject) → void',
        ),
      ],
      implementers: const [CenterScreen.routeName],
      seeAlso: const [
        AnimatedAlignScreen.routeName,
        CustomSingleChildLayoutScreen.routeName,
        CenterScreen.routeName,
        FractionallySizedBoxScreen.routeName,
      ],
    );
  }
}

final _stateProvider = StateNotifierProvider<_State, _Props>((ref) {
  return _State();
});

class _Props {
  _Props({
    required this.alignment,
    this.widthFactor,
    this.heightFactor,
  });

  final AlignmentGeometry alignment;
  final double? widthFactor;
  final double? heightFactor;

  _Props.initial()
      : alignment = Alignment.center,
        widthFactor = null,
        heightFactor = null;

  _Props initial() => _Props.initial();

  _Props copyWith({
    AlignmentGeometry? alignment,
    double? widthFactor,
    double? heightFactor,
  }) {
    return _Props(
      alignment: alignment ?? this.alignment,
      widthFactor: widthFactor ?? this.widthFactor,
      heightFactor: heightFactor ?? this.heightFactor,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setAlignment(AlignmentGeometry value) {
    state = state.copyWith(alignment: value);
  }

  void setWidthFactor(double value) {
    state = state.copyWith(widthFactor: value);
  }

  void setHeightFactor(double value) {
    state = state.copyWith(heightFactor: value);
  }
}

class _Sample extends StatelessWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 150,
      child: Container(
        color: CupertinoColors.activeGreen,
        child: Align(
          alignment: state.alignment,
          widthFactor: state.widthFactor,
          heightFactor: state.heightFactor,
          child: Container(
            width: 50,
            height: 50,
            color: const Color(0xa00000ff),
          ),
        ),
      ),
    );
  }
}
