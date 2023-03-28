import 'package:flutter/cupertino.dart';
import 'package:flutter_docs/pages.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class DrivenScrollActivityScreen extends StatelessWidget {
  const DrivenScrollActivityScreen({super.key});

  static const routeName = 'widgets/DrivenScrollActivity';
  static const title = 'DrivenScrollActivity';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
      parameters: [],
      inheritance: ScrollActionScreen.routeName,
    );
  }
}
