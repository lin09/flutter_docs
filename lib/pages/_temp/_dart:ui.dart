import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class XxxScreen extends StatelessWidget {
  const XxxScreen({super.key});

  static const routeName = 'dart-ui/Xxx';
  static const title = 'Xxx';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
