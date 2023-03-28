import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  Container(
    height: 100,
    decoration: ShapeDecoration(
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(),
      ),
    ),
  )
''';

class BeveledRectangleBorderScreen extends ConsumerWidget {
  const BeveledRectangleBorderScreen({super.key});

  static const routeName = 'painting/BeveledRectangleBorder';
  static const title = 'BeveledRectangleBorder';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '斜角矩形边框',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileBorderRadiusGeometry(
          value: state.borderRadius,
          onSelectedItemChanged: notifier.setBorderRadius,
        ),
        ListTileBorderSide(
          value: state.side,
          onSelectedItemChanged: notifier.setSide,
        ),
      ],
      inheritance: OutlinedBorderScreen.routeName,
      properties: const [
        ListTile(
          name: 'borderRadius → BorderRadiusGeometry',
        ),
      ],
      methods: const [
        ListTile(
          name:
              'copyWith({BorderSide? side, BorderRadiusGeometry? borderRadius}) → BeveledRectangleBorder',
        ),
        ListTile(
          name:
              'getInnerPath(Rect rect, {TextDirection? textDirection}) → Path',
        ),
        ListTile(
          name:
              'getOuterPath(Rect rect, {TextDirection? textDirection}) → Path',
        ),
        ListTile(
          name: 'lerpFrom(ShapeBorder? a, double t) → ShapeBorder?',
        ),
        ListTile(
          name: 'lerpTo(ShapeBorder? b, double t) → ShapeBorder?',
        ),
        ListTile(
          name:
              'paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) → void',
        ),
        ListTile(
          name: 'scale(double t) → ShapeBorder',
        ),
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
        decoration: ShapeDecoration(
          color: CupertinoColors.activeBlue,
          shape: BeveledRectangleBorder(
            borderRadius: state.borderRadius,
            side: state.side,
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
    required this.borderRadius,
    required this.side,
  });

  final BorderRadiusGeometry borderRadius;
  final BorderSide side;

  _Props.initial()
      : borderRadius = BorderRadius.zero,
        side = BorderSide.none;

  _Props initial() => _Props.initial();

  _Props copyWith({
    BorderRadiusGeometry? borderRadius,
    BorderSide? side,
  }) {
    return _Props(
      borderRadius: borderRadius ?? this.borderRadius,
      side: side ?? this.side,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setBorderRadius(BorderRadiusGeometry value) {
    state = state.copyWith(borderRadius: value);
  }

  void setSide(BorderSide value) {
    state = state.copyWith(side: value);
  }
}
