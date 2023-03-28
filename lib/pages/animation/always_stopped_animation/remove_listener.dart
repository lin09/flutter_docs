import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  @override
  void removeListener(VoidCallback listener) { }
''';

class AlwaysStoppedAnimationRemoveListenerScreen extends StatelessWidget {
  const AlwaysStoppedAnimationRemoveListenerScreen({super.key});

  static const routeName = 'animation/AlwaysStoppedAnimation/removeListener';
  static const title = 'AlwaysStoppedAnimation removeListener method';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
      seeAlso: [VoidCallbackScreen.routeName],
    );
  }
}
