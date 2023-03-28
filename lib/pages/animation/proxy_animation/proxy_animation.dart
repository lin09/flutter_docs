import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class ProxyAnimationScreen extends StatelessWidget {
  const ProxyAnimationScreen({super.key});

  static const routeName = 'animation/ProxyAnimation';
  static const title = 'ProxyAnimation';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
