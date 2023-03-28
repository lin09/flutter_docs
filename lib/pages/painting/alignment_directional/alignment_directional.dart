import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class AlignmentDirectionalScreen extends StatelessWidget {
  const AlignmentDirectionalScreen({super.key});

  static const routeName = 'painting/AlignmentDirectional';
  static const title = 'AlignmentDirectional';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
