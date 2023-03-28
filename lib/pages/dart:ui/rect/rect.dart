import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class RectScreen extends StatelessWidget {
  const RectScreen({super.key});

  static const routeName = 'dart:ui/Rect';
  static const title = 'Rect';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
