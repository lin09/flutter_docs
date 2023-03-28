import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  final bool absorbing;
''';

class AbsorbPointerAbsorbingScreen extends StatelessWidget {
  const AbsorbPointerAbsorbingScreen({super.key});

  static const routeName = 'widgets/AbsorbPointer/absorbing';
  static const title = 'AbsorbPointer absorbing property';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation:
          'Whether this widget absorbs pointers during hit testing.\n\n'
          'Regardless of whether this render object absorbs pointers during hit '
          'testing, it will still consume space during layout and be visible '
          'during painting.',
      code: _code,
    );
  }
}
