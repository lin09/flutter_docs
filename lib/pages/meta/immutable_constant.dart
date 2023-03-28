import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class ImmutableConstantScreen extends StatelessWidget {
  const ImmutableConstantScreen({super.key});

  static const routeName = 'meta/constant/immutable';
  static const title = 'immutable top-level constant';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
