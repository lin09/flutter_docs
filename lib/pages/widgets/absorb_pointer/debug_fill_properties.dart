import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('absorbing', absorbing));
    properties.add(DiagnosticsProperty<bool>('ignoringSemantics', ignoringSemantics, defaultValue: null));
  }
''';

class AbsorbPointerDebugFillPropertiesScreen extends StatelessWidget {
  const AbsorbPointerDebugFillPropertiesScreen({super.key});

  static const routeName = 'widgets/AbsorbPointer/debugFillProperties';
  static const title = 'AbsorbPointer debugFillProperties method';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
