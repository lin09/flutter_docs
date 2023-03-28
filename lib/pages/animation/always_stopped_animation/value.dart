import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  @override
  final T value;
''';

class AlwaysStoppedAnimationValueScreen extends StatelessWidget {
  const AlwaysStoppedAnimationValueScreen({super.key});

  static const routeName = 'animation/AlwaysStoppedAnimation/value';
  static const title = 'AlwaysStoppedAnimation value property';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: 'The current value of the animation.',
      code: _code,
    );
  }
}
