import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  final GlobalKey<AnimatedListState> _gridKey =
    GlobalKey<AnimatedListState>();
  ...
    // 添加项目
    _gridKey.currentState?.insertItem(...)
  ...
    // 删除项目
    _gridKey.currentState?.removeItem(...)
  ...
  AnimatedList(
    key: _gridKey,
    initialItemCount: _count,
    itemBuilder: _itemBuilder,
  },
  ...
''';

class AnimatedListScreen extends ConsumerWidget {
  const AnimatedListScreen({super.key});

  static const routeName = 'widgets/AnimatedList';
  static const title = 'AnimatedList';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '动画版本 List',
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
          description: 'Whether this is the primary scroll view associated with'
              ' the parent PrimaryScrollController.',
          value: state.primary,
          onChanged: notifier.setPrimary,
        ),
        ListTileScrollPhysics(
          value: state.physics,
          onSelectedItemChanged: notifier.setPhysics,
        ),
        ListTileSwitch(
          name: 'shrinkWrap',
          description: '滚动视图在 scrollDirection 中的范围是否应由正在查看的内容决定。',
          value: state.shrinkWrap,
          onChanged: notifier.setShrinkWrap,
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
      methods: const [
        ListTile(
          name: 'createState() → AnimatedListState',
        )
      ],
      staticMethods: const [
        ListTile(
          name: 'maybeOf(BuildContext context) → AnimatedListState?',
          description: '该类的最近实例中包含给定上下文的状态。',
        ),
        ListTile(
          name: 'of(BuildContext context) → AnimatedListState',
          description: '该类的最近实例中包含给定上下文的状态。',
        ),
      ],
      seeAlso: const [
        AnimatedGridScreen.routeName,
        SliverAnimatedListScreen.routeName,
        SliverAnimatedGridScreen.routeName,
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
    this.shrinkWrap = false,
    this.padding,
    this.clipBehavior = Clip.hardEdge,
  });

  final Axis scrollDirection;
  final bool reverse;
  final bool primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final Clip clipBehavior;

  _Props.initial()
      : scrollDirection = Axis.vertical,
        reverse = false,
        primary = false,
        physics = null,
        shrinkWrap = false,
        padding = null,
        clipBehavior = Clip.hardEdge;

  _Props initial() => _Props.initial();

  _Props copyWith({
    Axis? scrollDirection,
    bool? reverse,
    bool? primary,
    ScrollPhysics? physics,
    bool? shrinkWrap,
    EdgeInsetsGeometry? padding,
    Clip? clipBehavior,
  }) {
    return _Props(
      scrollDirection: scrollDirection ?? this.scrollDirection,
      reverse: reverse ?? this.reverse,
      primary: primary ?? this.primary,
      physics: physics ?? this.physics,
      shrinkWrap: shrinkWrap ?? this.shrinkWrap,
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

  void setShrinkWrap(bool value) {
    state = state.copyWith(shrinkWrap: value);
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
  final GlobalKey<AnimatedListState> _gridKey = GlobalKey<AnimatedListState>();
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
        child: Padding(
          padding: const EdgeInsets.only(bottom: 1.0),
          child: Container(
            color: CupertinoColors.activeBlue,
            alignment: Alignment.center,
            child: Text((index + 1).toString()),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final state = widget.state;

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
          child: AnimatedList(
            key: _gridKey,
            initialItemCount: _count,
            itemBuilder: _itemBuilder,
            scrollDirection: state.scrollDirection,
            reverse: state.reverse,
            primary: state.primary,
            physics: state.physics,
            shrinkWrap: state.shrinkWrap,
            padding: state.padding,
            clipBehavior: state.clipBehavior,
          ),
        ),
      ],
    );
  }
}
