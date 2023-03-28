import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''源码
  class AutocompleteNextOptionIntent extends Intent {
    const AutocompleteNextOptionIntent();
  }
''';

class AutocompleteNextOptionIntentScreen extends StatelessWidget {
  const AutocompleteNextOptionIntentScreen({super.key});

  static const routeName = 'widgets/AutocompleteNextOptionIntent';
  static const title = 'AutocompleteNextOptionIntent';

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
