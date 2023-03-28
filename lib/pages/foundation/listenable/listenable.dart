import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class ListenableScreen extends StatelessWidget {
  const ListenableScreen({super.key});

  static const routeName = 'foundation/Listenable';
  static const title = 'Listenable';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
