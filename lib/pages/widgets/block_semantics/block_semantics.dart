import 'package:flutter/cupertino.dart';
import 'package:flutter_docs/pages.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  BlockSemantics({
    Key? key,
    bool blocking = true,
    Widget? child,
  })
''';

class BlockSemanticsScreen extends StatelessWidget {
  const BlockSemanticsScreen({super.key});

  static const routeName = 'widgets/BlockSemantics';
  static const title = 'BlockSemantics';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '它放弃了在它之前的同一个语义容器中所有语义。\n'
          '当 Drawer 打开时，可以去除其他语义，避免读屏器读出被抽屉覆盖的语义内容，造成使用者的困扰。',
      code: _code,
      parameters: [
        ListTile(
          name: 'blocking',
          description: '是否放弃之前的同一个语义容器中所有语义',
          type: 'bool',
        ),
        ListTileChild(),
      ],
      inheritance: SingleChildRenderObjectWidgetScreen.routeName,
    );
  }
}
