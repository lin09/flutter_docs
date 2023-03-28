import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  final GlobalKey<AnimatedGridState> _gridKey =
    GlobalKey<AnimatedGridState>();
  ...
    // 添加项目
    _gridKey.currentState?.insertItem(...)
  ...
    // 删除项目
    _gridKey.currentState?.removeItem(...)
  ...
  AnimatedGrid(
    key: _gridKey,
    initialItemCount: _count,
    itemBuilder: _itemBuilder,
  },
  ...
''';

class AnimatedGridScreen extends ConsumerWidget {
  const AnimatedGridScreen({super.key});

  static const routeName = 'widgets/AnimatedGrid';
  static const title = 'AnimatedGrid';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '动画版本 Grid',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileAxis(
          name: 'scrollDirection',
          description: '设置哪个轴滚动',
          value: state.scrollDirection,
          onSelectedItemChanged: notifier.setScrollDirection,
        ),
        ListTileSwitch(
          name: 'reverse',
          description: '反滚动方向布局',
          value: state.reverse,
          onChanged: notifier.setReverse,
        ),
        ListTileSwitch(
          name: 'primary',
          description:
              'Whether this is the primary scroll view associated with '
              'the parent PrimaryScrollController.',
          value: state.primary,
          onChanged: notifier.setPrimary,
        ),
        ListTileScrollPhysics(
          value: state.physics,
          onSelectedItemChanged: notifier.setPhysics,
        ),
        ListTilePadding(
          value: state.padding,
          onSelectedItemChanged: notifier.setPadding,
        ),
        ListTileClip(
          value: state.clipBehavior,
          onSelectedItemChanged: notifier.setClipBehavior,
        ),
      ],
      inheritance: StatefulWidgetScreen.routeName,
      properties: const [
        ListTile(
          name: 'gridDelegate → SliverGridDelegate',
        ),
      ],
      methods: const [
        ListTile(
          name: 'createState() → AnimatedGridState',
        ),
      ],
      staticMethods: const [
        ListTile(
          name: 'maybeOf(BuildContext context) → AnimatedGridState?',
          description: '该类的最近实例中包含给定上下文的状态。',
        ),
        ListTile(
          name: 'of(BuildContext context) → AnimatedGridState',
          description: '该类的最近实例中包含给定上下文的状态。',
        ),
      ],
    );
  }
}

final _stateProvider = StateNotifierProvider<_State, _Props>((ref) {
  return _State();
});

class _Props {
  _Props({
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.primary = false,
    this.physics,
    this.padding,
    this.clipBehavior = Clip.hardEdge,
  });

  final Axis scrollDirection;
  final bool reverse;
  final bool primary;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final Clip clipBehavior;

  _Props.initial()
      : scrollDirection = Axis.vertical,
        reverse = false,
        primary = false,
        physics = null,
        padding = null,
        clipBehavior = Clip.hardEdge;

  _Props initial() => _Props.initial();

  _Props copyWith({
    Axis? scrollDirection,
    bool? reverse,
    bool? primary,
    ScrollPhysics? physics,
    EdgeInsetsGeometry? padding,
    Clip? clipBehavior,
  }) {
    return _Props(
      scrollDirection: scrollDirection ?? this.scrollDirection,
      reverse: reverse ?? this.reverse,
      primary: primary ?? this.primary,
      physics: physics ?? this.physics,
      padding: padding ?? this.padding,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setScrollDirection(Axis value) {
    state = state.copyWith(scrollDirection: value);
  }

  void setReverse(bool value) {
    state = state.copyWith(reverse: value);
  }

  void setPrimary(bool value) {
    state = state.copyWith(primary: value);
  }

  void setPhysics(ScrollPhysics value) {
    state = state.copyWith(physics: value);
  }

  void setPadding(EdgeInsetsGeometry value) {
    state = state.copyWith(padding: value);
  }

  void setClipBehavior(Clip value) {
    state = state.copyWith(clipBehavior: value);
  }
}

class _Sample extends StatefulWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  State<_Sample> createState() => _SampleState();
}

class _SampleState extends State<_Sample> {
  final GlobalKey<AnimatedGridState> _gridKey = GlobalKey<AnimatedGridState>();
  int _count = 1;

  void _insertItem() {
    setState(() {
      _gridKey.currentState?.insertItem(
        _count,
        duration: const Duration(milliseconds: 500),
      );
    });
    ++_count;
  }

  void _removeItem() {
    --_count;
    setState(() {
      _gridKey.currentState?.removeItem(
        _count,
        (context, animation) => _itemBuilder(
          context,
          _count,
          animation,
          removing: true,
        ),
      );
    });
  }

  @override
  void dispose() {
    _gridKey.currentState?.dispose();
    super.dispose();
  }

  Widget _itemBuilder(context, index, animation, {bool removing = false}) =>
      ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: removing ? Curves.easeInOut : Curves.bounceOut,
        ),
        child: Container(
          height: 80,
          color: CupertinoColors.activeOrange,
          alignment: Alignment.center,
          child: Text((index + 1).toString()),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CupertinoButton.filled(
                padding: const EdgeInsets.all(10),
                borderRadius: BorderRadius.circular(99),
                onPressed: _count > 0 ? _removeItem : null,
                child: const Icon(CupertinoIcons.minus),
              ),
              CupertinoButton.filled(
                padding: const EdgeInsets.all(10),
                borderRadius: BorderRadius.circular(99),
                onPressed: _insertItem,
                child: const Icon(CupertinoIcons.add),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: AnimatedGrid(
            key: _gridKey,
            initialItemCount: _count,
            itemBuilder: _itemBuilder,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            scrollDirection: widget.state.scrollDirection,
            reverse: widget.state.reverse,
            primary: widget.state.primary,
            physics: widget.state.physics,
            padding: widget.state.padding,
            clipBehavior: widget.state.clipBehavior,
          ),
        ),
      ],
    );
  }
}
