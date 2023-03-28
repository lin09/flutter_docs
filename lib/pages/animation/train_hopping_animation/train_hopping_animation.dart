import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class TrainHoppingAnimationScreen extends StatelessWidget {
  const TrainHoppingAnimationScreen({super.key});

  static const routeName = 'animation/TrainHoppingAnimation';
  static const title = 'TrainHoppingAnimation';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
