import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class WidgetsAppDefaultShortcutsScreen extends StatelessWidget {
  const WidgetsAppDefaultShortcutsScreen({super.key});

  static const routeName = 'widgets/WidgetsApp.defaultShortcuts';
  static const title = 'WidgetsApp defaultShortcuts property';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
