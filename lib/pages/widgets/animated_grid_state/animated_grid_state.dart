import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  final GlobalKey<AnimatedGridState> _gridKey =
    GlobalKey<AnimatedGridState>();
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
          removing: true, // 用来判断
        ),
      );
    });
  }

  ...
  AnimatedGrid(
    key: _gridKey,
    itemBuilder: _itemBuilder,
    ...
  ),
  ...

''';

class AnimatedGridStateScreen extends StatelessWidget {
  const AnimatedGridStateScreen({super.key});

  static const routeName = 'widgets/AnimatedGridState';
  static const title = 'AnimatedGridState';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: 'AnimatedGrid 的 State，用于在插入或移除项目时为其设置动画。',
      code: _code,
      inheritance: ListTile(
        name: 'State<AnimatedGrid>',
        routeName: StateScreen.routeName,
      ),
      methods: [
        ListTile(
          name: 'build(BuildContext context) → Widget',
        ),
      ],
      seeAlso: [
        AnimatedGridScreen.routeName,
      ],
    );
  }
}
