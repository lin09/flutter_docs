import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class DiagnosticableScreen extends StatelessWidget {
  const DiagnosticableScreen({super.key});

  static const routeName = 'foundation/Diagnosticable';
  static const title = 'Diagnosticable';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
