import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  Container(
    height: 50,
    decoration: BoxDecoration(
      color: CupertinoColors.activeBlue,
      border: BorderDirectional(
        top: BorderSide(),
        bottom: BorderSide(),
        start: BorderSide(),
        end: BorderSide(),
      ),
    ),
  ),
  ...
''';

class BorderDirectionalScreen extends ConsumerWidget {
  const BorderDirectionalScreen({super.key});

  static const routeName = 'painting/BorderDirectional';
  static const title = 'BorderDirectional';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '边框，侧面根据阅读方向设置。四边 strokeAlign 要统一',
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
          name: 'bottom',
          description: '下边框',
          value: state.bottom,
          onSelectedItemChanged: notifier.setBottom,
        ),
        ListTileBorderSide(
          name: 'start',
          description: '开始方向的边框',
          value: state.start,
          onSelectedItemChanged: notifier.setStart,
        ),
        ListTileBorderSide(
          name: 'end',
          description: '结束方向的边框',
          value: state.end,
          onSelectedItemChanged: notifier.setEnd,
        ),
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
          name: 'end → BorderSide',
        ),
        ListTile(
          name: 'start → BorderSide',
        ),
        ListTile(
          name: 'top → BorderSide',
        ),
      ],
      methods: const [
        ListTile(
          name: 'add(ShapeBorder other, {bool reversed = false}) → BoxBorder?',
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
          name: 'scale(double t) → BorderDirectional',
        ),
      ],
      staticMethods: const [
        ListTile(
          name:
              'lerp(BorderDirectional? a, BorderDirectional? b, double t) → BorderDirectional?',
        ),
        ListTile(
          name:
              'merge(BorderDirectional a, BorderDirectional b) → BorderDirectional',
        ),
      ],
      seeAlso: const [
        BoxDecorationScreen.routeName,
        BorderSideScreen.routeName,
      ],
    );
  }
}

class _Sample extends StatelessWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: CupertinoColors.activeGreen,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: CupertinoColors.activeBlue,
          border: BorderDirectional(
            top: state.top,
            bottom: state.bottom,
            start: state.start,
            end: state.end,
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
    required this.start,
    required this.bottom,
    required this.end,
  });

  final BorderSide top;
  final BorderSide start;
  final BorderSide bottom;
  final BorderSide end;

  _Props.initial()
      : top = BorderSide.none,
        start = BorderSide.none,
        bottom = BorderSide.none,
        end = BorderSide.none;

  _Props initial() => _Props.initial();

  _Props copyWith({
    BorderSide? top,
    BorderSide? start,
    BorderSide? bottom,
    BorderSide? end,
  }) {
    return _Props(
      top: top ?? this.top,
      start: start ?? this.start,
      bottom: bottom ?? this.bottom,
      end: end ?? this.end,
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

  void setStart(BorderSide value) {
    state = state.copyWith(start: value);
  }

  void setBottom(BorderSide value) {
    state = state.copyWith(bottom: value);
  }

  void setEnd(BorderSide value) {
    state = state.copyWith(end: value);
  }
}
