import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  @override
  void addListener(VoidCallback listener) { }
''';

class AlwaysStoppedAnimationAddListenerScreen extends StatelessWidget {
  const AlwaysStoppedAnimationAddListenerScreen({super.key});

  static const routeName = 'animation/AlwaysStoppedAnimation/addListener';
  static const title = 'AlwaysStoppedAnimation addListener method';

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
