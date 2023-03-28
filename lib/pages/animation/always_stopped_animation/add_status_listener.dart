import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  @override
  void addStatusListener(VoidCallback listener) { }
''';

class AlwaysStoppedAnimationAddStatusListenerScreen extends StatelessWidget {
  const AlwaysStoppedAnimationAddStatusListenerScreen({super.key});

  static const routeName = 'animation/AlwaysStoppedAnimation/addStatusListener';
  static const title = 'AlwaysStoppedAnimation addStatusListener method';

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
