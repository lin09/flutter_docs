import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class TextStyleScreen extends StatelessWidget {
  const TextStyleScreen({super.key});

  static const routeName = 'painting/TextStyle';
  static const title = 'TextStyle';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
