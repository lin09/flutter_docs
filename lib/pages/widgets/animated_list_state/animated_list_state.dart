import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  final GlobalKey<AnimatedListState> _gridKey =
    GlobalKey<AnimatedListState>();
  int _count = 1;

  // 添加项目
  void _insertItem() {
    setState(() {
      _gridKey.currentState?.insertItem(
        _count,
        duration: const Duration(milliseconds: 500),
      );
    });
    ++_count;
  }

  // 删除项目
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

  ...
  AnimatedList(
    key: _gridKey,
    itemBuilder: _itemBuilder,
    ...
  ),
  ...

''';

class AnimatedListStateScreen extends StatelessWidget {
  const AnimatedListStateScreen({super.key});

  static const routeName = 'widgets/AnimatedListState';
  static const title = 'AnimatedListState';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: 'AnimatedList 的 State，用于在插入或移除项目时为其设置动画。',
      code: _code,
      inheritance: ListTile(
        name: 'State<AnimatedList>',
        routeName: StateScreen.routeName,
      ),
      methods: [
        ListTile(
          name: 'build(BuildContext context) → Widget',
        ),
      ],
      seeAlso: [
        AnimatedListScreen.routeName,
      ],
    );
  }
}
