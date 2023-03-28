import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show FlutterLogo;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  late final AnimationController _controller =
    AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

  late final Animation<AlignmentGeometry> _animation =
    Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  ...
  AlignTransition(
    alignment: _animation,
    child: ...,
  ),
  ...
''';

class AlignTransitionScreen extends ConsumerWidget {
  const AlignTransitionScreen({super.key});

  static const routeName = 'widgets/AlignTransition';
  static const title = 'AlignTransition';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var notifier = ref.read(_stateProvider.notifier);
    var state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      code: _code,
      explanation:
          'AlignTransition 是 Align 的 Animated 版本， 使其 Align.alignment 属性动画化。',
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        const ListTile(
          name: 'alignment',
          description: '控制子部件对齐的动画。',
          type: ' Animation<AlignmentGeometry>',
          typeWidth: 200,
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
      inheritance: AnimatedWidgetScreen.routeName,
      properties: const [
        ListTile(
          name: 'alignment → Animation<AlignmentGeometry>',
        ),
        ListTile(
          name: 'child → Widget',
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
          name: 'build(BuildContext context) → Widget',
        ),
      ],
      seeAlso: const [
        AnimationScreen.routeName,
        PositionedTransitionScreen.routeName,
        RelativePositionedTransitionScreen.routeName,
        SizeTransitionScreen.routeName,
        SlideTransitionScreen.routeName,
      ],
    );
  }
}

final _stateProvider = StateNotifierProvider<_State, _Props>((ref) {
  return _State();
});

class _Props {
  _Props({
    this.widthFactor,
    this.heightFactor,
  });

  final double? widthFactor;
  final double? heightFactor;

  _Props.initial()
      : widthFactor = null,
        heightFactor = null;

  _Props initial() => _Props.initial();

  _Props copyWith({
    double? widthFactor,
    double? heightFactor,
  }) {
    return _Props(
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

  void setWidthFactor(double value) {
    state = state.copyWith(widthFactor: value);
  }

  void setHeightFactor(double value) {
    state = state.copyWith(heightFactor: value);
  }
}

class _Sample extends StatefulWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  State<_Sample> createState() => _SampleState();
}

class _SampleState extends State<_Sample> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<AlignmentGeometry> _animation = Tween<AlignmentGeometry>(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = widget.state;

    return Container(
      alignment: Alignment.center,
      height: 150,
      child: Container(
        color: CupertinoColors.activeOrange,
        child: AlignTransition(
          alignment: _animation,
          widthFactor: state.widthFactor,
          heightFactor: state.heightFactor,
          child: const FlutterLogo(size: 50),
        ),
      ),
    );
  }
}
