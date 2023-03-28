import 'package:flutter/cupertino.dart';
import 'package:flutter_docs/pages.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  BackButtonListener({
    Key? key,
    required Widget child,
    required ValueGetter<Future<bool>> onBackButtonPressed,
  })
''';

class BackButtonListenerScreen extends ConsumerWidget {
  const BackButtonListenerScreen({super.key});

  static const routeName = 'widgets/BackButtonListener';
  static const title = 'BackButtonListener';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
      inheritance: StatefulWidgetScreen.routeName,
    );
  }
}
