import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class OutlinedBorderScreen extends StatelessWidget {
  const OutlinedBorderScreen({super.key});

  static const routeName = 'painting/OutlinedBorder';
  static const title = 'OutlinedBorder';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
