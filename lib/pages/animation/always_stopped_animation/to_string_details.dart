import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  @override
  String toStringDetails() {
    return '\${super.toStringDetails()} \$value; paused';
  }
''';

class AlwaysStoppedAnimationToStringDetailsScreen extends StatelessWidget {
  const AlwaysStoppedAnimationToStringDetailsScreen({super.key});

  static const routeName = 'animation/AlwaysStoppedAnimation/toStringDetails';
  static const title = 'AlwaysStoppedAnimation toStringDetails method';

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
