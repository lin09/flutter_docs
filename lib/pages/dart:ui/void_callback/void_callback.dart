import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class VoidCallbackScreen extends StatelessWidget {
  const VoidCallbackScreen({super.key});

  static const routeName = 'dart:ui/VoidCallback';
  static const title = 'VoidCallback';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
