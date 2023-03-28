import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class WidgetsAppShortcutsScreen extends StatelessWidget {
  const WidgetsAppShortcutsScreen({super.key});

  static const routeName = 'widgets/WidgetsApp.shortcuts';
  static const title = 'WidgetsApp shortcuts property';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
