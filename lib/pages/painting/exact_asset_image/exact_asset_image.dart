import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class ExactAssetImageScreen extends StatelessWidget {
  const ExactAssetImageScreen({super.key});

  static const routeName = 'painting/ExactAssetImage';
  static const title = 'ExactAssetImage';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
