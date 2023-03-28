import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  Container(
    width: 200,
    height: 50,
    decoration: BoxDecoration(
      color: CupertinoColors.activeBlue,
      border: Border.fromBorderSide(
        BorderSide(
          color: state.color,
          width: state.width,
          style: state.style,
          strokeAlign: state.strokeAlign,
        ),
      ),
    ),
  ),
  ...
''';

class BorderSideScreen extends ConsumerWidget {
  const BorderSideScreen({super.key});

  static const routeName = 'painting/BorderSide';
  static const title = 'BorderSide';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '...',
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
      mixedInTypes: const [DiagnosticableScreen.routeName],
      properties: const [],
      methods: const [],
      staticMethods: const [],
      seeAlso: const [
        BorderScreen.routeName,
        BoxDecorationScreen.routeName,
        TableBorderScreen.routeName,
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
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      color: CupertinoColors.activeGreen,
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: CupertinoColors.activeBlue,
          border: Border.fromBorderSide(
            BorderSide(
              color: state.color,
              width: state.width,
              style: state.style,
              strokeAlign: state.strokeAlign,
            ),
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
