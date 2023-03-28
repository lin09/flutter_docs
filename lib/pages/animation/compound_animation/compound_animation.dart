import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class CompoundAnimationScreen extends StatelessWidget {
  const CompoundAnimationScreen({super.key});

  static const routeName = 'animation/CompoundAnimation';
  static const title = 'CompoundAnimation';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
