import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class CurveTweenScreen extends StatelessWidget {
  const CurveTweenScreen({super.key});

  static const routeName = 'animation/CurveTween';
  static const title = 'CurveTween';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
