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
      border: Border(
        top: BorderSide(width: 10),
        right: BorderSide(),
        bottom: BorderSide(),
        left: BorderSide(),
      ),
    ),
  ),
  ...
''';

class BorderScreen extends ConsumerWidget {
  const BorderScreen({super.key});

  static const routeName = 'painting/Border';
  static const title = 'Border';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '边框。四边 strokeAlign 要统一',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileBorderSide(
          name: 'top',
          description: '上边框',
          value: state.top,
          onSelectedItemChanged: notifier.setTop,
        ),
        ListTileBorderSide(
          name: 'right',
          description: '右边框',
          value: state.right,
          onSelectedItemChanged: notifier.setRight,
        ),
        ListTileBorderSide(
          name: 'bottom',
          description: '下边框',
          value: state.bottom,
          onSelectedItemChanged: notifier.setBottom,
        ),
        ListTileBorderSide(
          name: 'left',
          description: '左边框',
          value: state.left,
          onSelectedItemChanged: notifier.setLeft,
        ),
      ],
      constructors: const [
        BorderAllScreen.routeName,
        BorderFromBorderSideScreen.routeName,
        BorderSymmetricScreen.routeName,
      ],
      inheritance: BoxBorderScreen.routeName,
      properties: const [
        ListTile(
          name: 'bottom → BorderSide',
        ),
        ListTile(
          name: 'dimensions → EdgeInsetsGeometry',
        ),
        ListTile(
          name: 'isUniform → bool',
        ),
        ListTile(
          name: 'left → BorderSide',
        ),
        ListTile(
          name: 'right → BorderSide',
        ),
        ListTile(
          name: 'top → BorderSide',
        ),
      ],
      methods: const [
        ListTile(
          name: 'add(ShapeBorder other, {bool reversed = false}) → Border?',
        ),
        ListTile(
          name: 'lerpFrom(ShapeBorder? a, double t) → ShapeBorder?',
        ),
        ListTile(
          name: 'lerpTo(ShapeBorder? b, double t) → ShapeBorder?',
        ),
        ListTile(
          name:
              'paint(Canvas canvas, Rect rect, {TextDirection? textDirection, BoxShape shape = BoxShape.rectangle, BorderRadius? borderRadius}) → void',
        ),
        ListTile(
          name: 'scale(double t) → Border',
        ),
      ],
      staticMethods: const [
        ListTile(
          name: 'lerp(Border? a, Border? b, double t) → Border?',
        ),
        ListTile(
          name: 'merge(Border a, Border b) → Border',
        ),
      ],
      seeAlso: const [
        BoxDecorationScreen.routeName,
        BorderSideScreen.routeName,
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
          border: Border(
            top: state.top,
            right: state.right,
            bottom: state.bottom,
            left: state.left,
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
    required this.top,
    required this.right,
    required this.bottom,
    required this.left,
  });

  final BorderSide top;
  final BorderSide right;
  final BorderSide bottom;
  final BorderSide left;

  _Props.initial()
      : top = BorderSide.none,
        right = BorderSide.none,
        bottom = BorderSide.none,
        left = BorderSide.none;

  _Props initial() => _Props.initial();

  _Props copyWith({
    BorderSide? top,
    BorderSide? right,
    BorderSide? bottom,
    BorderSide? left,
  }) {
    return _Props(
      top: top ?? this.top,
      right: right ?? this.right,
      bottom: bottom ?? this.bottom,
      left: left ?? this.left,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setTop(BorderSide value) {
    state = state.copyWith(top: value);
  }

  void setRight(BorderSide value) {
    state = state.copyWith(right: value);
  }

  void setBottom(BorderSide value) {
    state = state.copyWith(bottom: value);
  }

  void setLeft(BorderSide value) {
    state = state.copyWith(left: value);
  }
}
