import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class AnimationLocalListenersMixinScreen extends StatelessWidget {
  const AnimationLocalListenersMixinScreen({super.key});

  static const routeName = 'animation/AnimationLocalListenersMixin';
  static const title = 'AnimationLocalListenersMixin';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
