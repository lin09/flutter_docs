import 'package:flutter/cupertino.dart';
import 'package:flutter_docs/pages.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  BallisticScrollActivity(
    ScrollActivityDelegate delegate,
    Simulation simulation,
    TickerProvider vsync,
    bool shouldIgnorePointer,
  )
''';

class BallisticScrollActivityScreen extends StatelessWidget {
  const BallisticScrollActivityScreen({super.key});

  static const routeName = 'widgets/BallisticScrollActivity';
  static const title = 'BallisticScrollActivity';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
      parameters: [
        ListTile(
          name: 'delegate',
          description: '',
          type: 'ScrollActivityDelegate',
        ),
        ListTile(
          name: 'simulation',
          description: '',
          type: 'Simulation',
        ),
        ListTile(
          name: 'vsync',
          description: '',
          type: 'TickerProvider',
        ),
        ListTile(
          name: 'shouldIgnorePointer',
          description: '',
          type: 'bool',
        ),
      ],
      inheritance: ScrollActionScreen.routeName,
      properties: [
        ListTile(
          name: 'shouldIgnorePointer → bool',
        ),
        ListTile(
          name: 'velocity → double',
        ),
      ],
      methods: [
        ListTile(
          name: 'applyMoveTo(double value) → bool',
        ),
        ListTile(
          name: 'applyNewDimensions() → void',
        ),
        ListTile(
          name:
              'dispatchOverscrollNotification(ScrollMetrics metrics, BuildContext context, double overscroll) → void',
        ),
        ListTile(
          name: 'dispose() → void',
        ),
        ListTile(
          name: 'resetActivity() → void',
        ),
      ],
      seeAlso: [DrivenScrollActivityScreen.routeName],
    );
  }
}
