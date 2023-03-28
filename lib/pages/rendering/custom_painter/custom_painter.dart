import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class CustomPainterScreen extends ConsumerWidget {
  const CustomPainterScreen({super.key});

  static const routeName = 'rendering/CustomPainter';
  static const title = 'CustomPainter';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
