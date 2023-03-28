import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class AnnotatedRegionLayerScreen extends StatelessWidget {
  const AnnotatedRegionLayerScreen({super.key});

  static const routeName = 'rendering/AnnotatedRegionLayer';
  static const title = 'AnnotatedRegionLayer';

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
