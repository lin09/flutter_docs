import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class AnimationLocalStatusListenersMixinScreen extends StatelessWidget {
  const AnimationLocalStatusListenersMixinScreen({super.key});

  static const routeName = 'animation/AnimationLocalStatusListenersMixin';
  static const title = 'AnimationLocalStatusListenersMixin';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
