import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  final bool ignoringSemantics;
''';

class AbsorbPointerIgnoringSemanticsScreen extends StatelessWidget {
  const AbsorbPointerIgnoringSemanticsScreen({super.key});

  static const routeName = 'widgets/AbsorbPointer/ignoringSemantics';
  static const title = 'AbsorbPointer ignoringSemantics';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
