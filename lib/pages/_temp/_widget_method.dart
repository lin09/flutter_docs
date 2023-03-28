import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class XxxMethodNameScreen extends StatelessWidget {
  const XxxMethodNameScreen({super.key});

  static const routeName = 'widgets/Xxx/methodName';
  static const title = 'Xxx methodName method';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
