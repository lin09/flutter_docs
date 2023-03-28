import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class AnimationStatusScreen extends StatelessWidget {
  const AnimationStatusScreen({super.key});

  static const routeName = 'animation/AnimationStatus';
  static const title = 'AnimationStatus';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
