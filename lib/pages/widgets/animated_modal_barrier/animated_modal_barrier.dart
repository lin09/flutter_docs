import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  AnimatedModalBarrier({
    Key? key,
    required Animation<Color?> color,
    bool dismissible = true,
    String? semanticsLabel,
    bool? barrierSemanticsDismissible,
    VoidCallback? onDismiss,
  })
''';

class AnimatedModalBarrierScreen extends ConsumerWidget {
  const AnimatedModalBarrierScreen({super.key});

  static const routeName = 'widgets/AnimatedModalBarrier';
  static const title = 'AnimatedModalBarrier';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '渐渐显示/隐藏的遮罩层',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        const ListTile(
          name: 'color',
          description: '颜色动画',
          type: 'Animation<Color?>',
        ),
        ListTileSwitch(
          name: 'dismissible',
          description: '是否可点击触发 onDismiss',
          value: state.dismissible,
          onChanged: notifier.setDismissible,
        ),
        const ListTile(
          name: 'semanticsLabel',
          description: '如果遮罩层是可消除的，则用于该遮罩层的语义标签',
          type: 'String',
        ),
        const ListTile(
          name: 'barrierSemanticsDismissible',
          description: '语义是否包含在语义树中',
          type: 'bool',
        ),
        const ListTile(
          name: 'onDismiss',
          description: '如果为空，点击会触发返回上个路由',
          type: 'VoidCallback',
        ),
      ],
      inheritance: AnimatedWidgetScreen.routeName,
      properties: const [
        ListTile(
          name: 'barrierSemanticsDismissible → bool?',
        ),
        ListTile(
          name: 'color → Animation<Color?>',
        ),
        ListTile(
          name: 'dismissible → bool',
        ),
        ListTile(
          name: 'onDismiss → VoidCallback?',
        ),
        ListTile(
          name: 'semanticsLabel → String?',
        ),
      ],
      methods: const [
        ListTile(
          name: 'build(BuildContext context) → Widget',
        ),
      ],
      seeAlso: const [
        ModelRouteScreen.routeName,
      ],
    );
  }
}

final _stateProvider = StateNotifierProvider<_State, _Props>((ref) {
  return _State();
});

class _Props {
  _Props({
    this.dismissible = true,
  });

  final bool dismissible;

  _Props.initial() : dismissible = true;

  _Props initial() => _Props.initial();

  _Props copyWith({
    bool? dismissible,
  }) {
    return _Props(
      dismissible: dismissible ?? this.dismissible,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setDismissible(bool value) {
    state = state.copyWith(dismissible: value);
  }
}

class _Sample extends StatefulWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  State<_Sample> createState() => _SampleState();
}

class _SampleState extends State<_Sample> with SingleTickerProviderStateMixin {
  late Animation<Color?> _colorTweenAnimation;
  late AnimationController _animationController;
  late bool _visible;

  @override
  void initState() {
    _visible = false;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _colorTweenAnimation = ColorTween(
      begin: const Color(0x00000000),
      end: CupertinoColors.systemFill,
    ).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void showModalBarrier() {
    setState(() {
      _visible = true;
    });
    _animationController.forward();
  }

  void hideModalBarrier() {
    _animationController.reverse().then((value) {
      setState(() {
        _visible = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;

    return SizedBox(
      height: 100,
      child: Stack(children: [
        Center(
          child: CupertinoButton.filled(
            onPressed: showModalBarrier,
            child: const Text('显示遮罩'),
          ),
        ),
        if (_visible)
          AnimatedModalBarrier(
            color: _colorTweenAnimation,
            dismissible: state.dismissible,
            onDismiss: hideModalBarrier,
          ),
      ]),
    );
  }
}
