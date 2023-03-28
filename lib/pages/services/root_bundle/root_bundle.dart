import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class RootBundleScreen extends StatelessWidget {
  const RootBundleScreen({super.key});

  static const routeName = 'services/rootBundle';
  static const title = 'rootBundle top-level property';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
