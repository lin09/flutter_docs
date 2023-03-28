import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class ActionOverridableScreen extends ConsumerWidget {
  const ActionOverridableScreen({super.key});

  static const routeName = 'widgets/Action.overridable';
  static const title = 'Action.overridable';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
