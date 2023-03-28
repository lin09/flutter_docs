import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  AndroidViewSurfaceSurface({
    Key? key,
    required AndroidViewSurfaceController controller,
    required PlatformViewHitTestBehavior hitTestBehavior,
    required
        Set<Factory<OneSequenceGestureRecognizer>>
        gestureRecognizers,
  }),
  ...
''';

class AndroidViewSurfaceScreen extends ConsumerWidget {
  const AndroidViewSurfaceScreen({super.key});

  static const routeName = 'widgets/AndroidViewSurface';
  static const title = 'AndroidViewSurface';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const PageScaffold(
      title: title,
      explanation: 'AndroidViewSurface 比 AndroidView 复杂。',
      code: _code,
      parameters: [
        ListTile(
          name: 'controller',
          description: '平台视图的控制器。',
          type: 'AndroidViewController',
        ),
        ListTile(
          name: 'hitTestBehavior',
          description: '命中测试期间的行为。',
          type: 'PlatformViewHitTestBehavior',
          typeWidth: 150,
        ),
        ListTile(
          name: 'gestureRecognizers',
          description: '哪些手势应转发到 Android 视图。',
          type: 'Set<Factory<OneSequenceGestureRecognizer>>',
          typeWidth: 150,
        ),
      ],
      inheritance: StatefulWidgetScreen.routeName,
      properties: [
        ListTile(
          name: 'controller → AndroidViewController',
        ),
        ListTile(
          name:
              'gestureRecognizers → Set<Factory<OneSequenceGestureRecognizer>>',
        ),
        ListTile(
          name: 'hitTestBehavior → PlatformViewHitTestBehavior',
        ),
      ],
      methods: [
        ListTile(
          name: 'createState() → State<StatefulWidget>',
        )
      ],
      seeAlso: [
        AndroidViewScreen.routeName,
        UiKitViewScreen.routeName,
      ],
    );
  }
}
