import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  @override
  AnimationStatus get status => AnimationStatus.forward;
''';

class AlwaysStoppedAnimationStatusScreen extends StatelessWidget {
  const AlwaysStoppedAnimationStatusScreen({super.key});

  static const routeName = 'animation/AlwaysStoppedAnimation/status';
  static const title = 'AlwaysStoppedAnimation status property';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: 'The current status of this animation.',
      code: _code,
      seeAlso: [AnimationStatusScreen.routeName],
    );
  }
}
