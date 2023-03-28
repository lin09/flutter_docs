import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class XxxMethodsMxxScreen extends StatelessWidget {
  const XxxMethodsMxxScreen({super.key});

  static const routeName = 'rendering/Xxx.mxx';
  static const title = 'Xxx mxx method';

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
