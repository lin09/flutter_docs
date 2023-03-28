import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class XxxCxxScreen extends ConsumerWidget {
  const XxxCxxScreen({super.key});

  static const routeName = 'widgets/Xxx.cxx';
  static const title = 'Xxx.cxx';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
