import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class ReverseAnimationScreen extends StatelessWidget {
  const ReverseAnimationScreen({super.key});

  static const routeName = 'animation/ReverseAnimation';
  static const title = 'ReverseAnimation';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
