import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class XxxConstantScreen extends StatelessWidget {
  const XxxConstantScreen({super.key});

  static const routeName = 'meta/constant/xxx';
  static const title = 'xxx top-level constant';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
