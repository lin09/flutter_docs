import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''源码
  abstract class ActivateAction extends Action<
    ActivateIntent
  > { }
''';

class ActivateActionScreen extends StatelessWidget {
  const ActivateActionScreen({super.key});

  static const routeName = 'widgets/ActivateAction';
  static const title = 'ActivateAction';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '一个 Action<ActivateIntent> 抽象类。',
      code: _code,
      inheritance: Inheritance(ActionScreen.routeName),
    );
  }
}
