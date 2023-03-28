import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  final Widget? child;
''';

class SingleChildRenderObjectWidgetChildScreen extends StatelessWidget {
  const SingleChildRenderObjectWidgetChildScreen({super.key});

  static const routeName = 'widgets/SingleChildRenderObjectWidget/child';
  static const title = 'SingleChildRenderObjectWidget child property';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: 'The widget below this widget in the tree.\n\n'
          'This widget can only have one child. To lay out multiple children, '
          'let this widget\'s child be a widget such as Row, Column, or Stack, '
          'which have a children property, and then provide the children to that widget.',
      code: _code,
      seeAlso: [WidgetScreen.routeName],
    );
  }
}
