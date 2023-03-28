import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class LayerMethodsFindScreen extends StatelessWidget {
  const LayerMethodsFindScreen({super.key});

  static const routeName = 'rendering/Layer.find';
  static const title = 'Layer find method';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
      parameters: [],
    );
  }
}
