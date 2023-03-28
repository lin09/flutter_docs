import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class TableBorderScreen extends StatelessWidget {
  const TableBorderScreen({super.key});

  static const routeName = 'rendering/TableBorder';
  static const title = 'TableBorder';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
      parameters: [],
    );
  }
}
