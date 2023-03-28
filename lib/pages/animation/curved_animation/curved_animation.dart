import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class CurvedAnimationScreen extends StatelessWidget {
  const CurvedAnimationScreen({super.key});

  static const routeName = 'animation/CurvedAnimation';
  static const title = 'CurvedAnimation';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
