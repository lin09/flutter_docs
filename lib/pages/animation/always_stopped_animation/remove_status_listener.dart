import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  @override
  void removeStatusListener(VoidCallback listener) { }
''';

class AlwaysStoppedAnimationRemoveStatusListenerScreen extends StatelessWidget {
  const AlwaysStoppedAnimationRemoveStatusListenerScreen({super.key});

  static const routeName =
      'animation/AlwaysStoppedAnimation/removeStatusListener';
  static const title = 'AlwaysStoppedAnimation removeStatusListener method';

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
