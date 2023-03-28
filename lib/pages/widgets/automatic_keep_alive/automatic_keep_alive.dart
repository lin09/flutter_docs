import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  AutomaticKeepAlive({Key? key, required Widget child})
''';

class AutomaticKeepAliveScreen extends StatelessWidget {
  const AutomaticKeepAliveScreen({super.key});

  static const routeName = 'widgets/AutomaticKeepAlive';
  static const title = 'AutomaticKeepAlive';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '允许子部件在惰性列表中保持活性',
      code: _code,
      parameters: [ListTileChild()],
      inheritance: StatefulWidgetScreen.routeName,
    );
  }
}
