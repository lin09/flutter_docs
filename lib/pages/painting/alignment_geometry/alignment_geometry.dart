import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class AlignmentGeometryScreen extends StatelessWidget {
  const AlignmentGeometryScreen({super.key});

  static const routeName = 'painting/AlignmentGeometry';
  static const title = 'AlignmentGeometry';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
