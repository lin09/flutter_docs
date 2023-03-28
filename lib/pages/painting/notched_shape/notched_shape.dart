import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class NotchedShapeScreen extends StatelessWidget {
  const NotchedShapeScreen({super.key});

  static const routeName = 'painting/NotchedShape';
  static const title = 'NotchedShape';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
