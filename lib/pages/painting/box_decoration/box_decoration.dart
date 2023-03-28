import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class BoxDecorationScreen extends StatelessWidget {
  const BoxDecorationScreen({super.key});

  static const routeName = 'painting/BoxDecoration';
  static const title = 'BoxDecoration';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
