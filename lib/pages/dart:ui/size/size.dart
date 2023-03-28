import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class SizeScreen extends StatelessWidget {
  const SizeScreen({super.key});

  static const routeName = 'dart:ui/Size';
  static const title = 'Size';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
