import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class ValueListenableScreen extends StatelessWidget {
  const ValueListenableScreen({super.key});

  static const routeName = 'foundation/ValueListenable';
  static const title = 'ValueListenable';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
