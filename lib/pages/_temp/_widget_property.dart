import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class XxxPropertyNameScreen extends StatelessWidget {
  const XxxPropertyNameScreen({super.key});

  static const routeName = 'widgets/Xxx.propertyName';
  static const title = 'Xxx propertyName property';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
