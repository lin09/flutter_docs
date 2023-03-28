import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class AutofillScopeMixinScreen extends StatelessWidget {
  const AutofillScopeMixinScreen({super.key});

  static const routeName = 'services/AutofillScopeMixin';
  static const title = 'AutofillScopeMixin';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
