import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class XxxScreen extends ConsumerWidget {
  const XxxScreen({super.key});

  static const routeName = 'widgets/Xxx';
  static const title = 'Xxx';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
