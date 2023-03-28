import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class TweenScreen extends StatelessWidget {
  const TweenScreen({super.key});

  static const routeName = 'animation/Tween';
  static const title = 'Tween';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
