import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''源码
  class ActivateIntent extends Intent {
    const ActivateIntent();
  }
''';

class ActivateIntentScreen extends StatelessWidget {
  const ActivateIntentScreen({super.key});

  static const routeName = 'widgets/ActivateIntent';
  static const title = 'ActivateIntent';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '一个 Intent 。',
      code: _code,
      inheritance: IntentScreen.routeName,
      seeAlso: [
        WidgetsAppDefaultShortcutsScreen.routeName,
        WidgetsAppShortcutsScreen.routeName,
      ],
    );
  }
}
