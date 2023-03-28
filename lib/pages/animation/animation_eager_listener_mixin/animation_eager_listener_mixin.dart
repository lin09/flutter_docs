import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class AnimationEagerListenerMixinScreen extends StatelessWidget {
  const AnimationEagerListenerMixinScreen({super.key});

  static const routeName = 'animation/AnimationEagerListenerMixin';
  static const title = 'AnimationEagerListenerMixin';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
