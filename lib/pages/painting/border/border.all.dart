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
      border: Border.all(
        color: const Color(0xFF000000),
        width: 1.0,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignInside,
      ),
    ),
  ),
  ...
''';

class BorderAllScreen extends ConsumerWidget {
  const BorderAllScreen({super.key});

  static const routeName = 'painting/Border.all';
  static const title = 'Border.all';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '统一设置四边边框',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileColor(
          value: state.color,
          onSelectedItemChanged: notifier.setColor,
        ),
        ListTileDouble(
          name: 'width',
          description: '边框粗细',
          value: state.width,
          onChanged: notifier.setWidth,
        ),
        ListTileBorderStyle(
          value: state.style,
          onSelectedItemChanged: notifier.setStyle,
        ),
        ListTileBorderSideStrokeAlign(
          value: state.strokeAlign,
          onSelectedItemChanged: notifier.setStrokeAlign,
        ),
      ],
      seeAlso: const [
        BorderScreen.routeName,
        BorderFromBorderSideScreen.routeName,
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
          border: Border.all(
            color: state.color,
            width: state.width,
            style: state.style,
            strokeAlign: state.strokeAlign,
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
    required this.color,
    required this.width,
    required this.style,
    required this.strokeAlign,
  });

  final Color color;
  final double width;
  final BorderStyle style;
  final double strokeAlign;

  _Props.initial()
      : color = const Color(0xFF000000),
        width = 1.0,
        style = BorderStyle.solid,
        strokeAlign = BorderSide.strokeAlignInside;

  _Props initial() => _Props.initial();

  _Props copyWith({
    Color? color,
    double? width,
    BorderStyle? style,
    double? strokeAlign,
  }) {
    return _Props(
      color: color ?? this.color,
      width: width ?? this.width,
      style: style ?? this.style,
      strokeAlign: strokeAlign ?? this.strokeAlign,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setColor(Color value) {
    state = state.copyWith(color: value);
  }

  void setWidth(double value) {
    state = state.copyWith(width: value);
  }

  void setStyle(BorderStyle value) {
    state = state.copyWith(style: value);
  }

  void setStrokeAlign(double value) {
    state = state.copyWith(strokeAlign: value);
  }
}
