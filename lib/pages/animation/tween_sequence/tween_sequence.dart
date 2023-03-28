import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class TweenSequenceScreen extends StatelessWidget {
  const TweenSequenceScreen({super.key});

  static const routeName = 'animation/TweenSequence';
  static const title = 'TweenSequence';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
