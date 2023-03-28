import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  @override
  RenderAbsorbPointer createRenderObject(BuildContext context) {
    return RenderAbsorbPointer(
      absorbing: absorbing,
      ignoringSemantics: ignoringSemantics,
    );
  }
''';

class AbsorbPointerCreateRenderObjectScreen extends StatelessWidget {
  const AbsorbPointerCreateRenderObjectScreen({super.key});

  static const routeName = 'widgets/AbsorbPointer/createRenderObject';
  static const title = 'AbsorbPointer createRenderObject method';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
