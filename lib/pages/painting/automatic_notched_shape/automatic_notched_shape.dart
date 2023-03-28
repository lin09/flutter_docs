import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  AutomaticNotchedShape(
    ShapeBorder host,
    [ShapeBorder? guest]
  )
''';

class AutomaticNotchedShapeScreen extends StatelessWidget {
  const AutomaticNotchedShapeScreen({super.key});

  static const routeName = 'painting/AutomaticNotchedShape';
  static const title = 'AutomaticNotchedShape';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '自动凹槽形状',
      code: _code,
      parameters: [
        ListTile(
          name: 'host',
          description: '使用 NotchedShape 的部件的形状（通常是BottomAppBar）。',
          type: 'ShapeBorder',
        ),
        ListTile(
          name: 'guest',
          description: '从主体中减去以形成缺口的形状。',
          type: 'ShapeBorder',
        ),
      ],
      inheritance: NotchedShapeScreen.routeName,
    );
  }
}
