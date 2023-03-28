import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class InheritedNotifierScreen extends ConsumerWidget {
  const InheritedNotifierScreen({super.key});

  static const routeName = 'widgets/InheritedNotifier';
  static const title = 'InheritedNotifier';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
    );
  }
}
