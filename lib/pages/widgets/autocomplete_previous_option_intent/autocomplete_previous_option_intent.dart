import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''源码
  class AutocompletePreviousOptionIntent extends Intent {
    const AutocompletePreviousOptionIntent();
  }
''';

class AutocompletePreviousOptionIntentScreen extends StatelessWidget {
  const AutocompletePreviousOptionIntentScreen({super.key});

  static const routeName = 'widgets/AutocompletePreviousOptionIntent';
  static const title = 'AutocompletePreviousOptionIntent';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '一个 Intent 。',
      code: _code,
      inheritance: IntentScreen.routeName,
    );
  }
}
