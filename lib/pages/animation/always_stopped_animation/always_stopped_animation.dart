import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  LinearProgressIndicator(
    // Animation<Color>
    valueColor: AlwaysStoppedAnimation(Colors.blue),
  ),
  ...
''';

class AlwaysStoppedAnimationScreen extends StatelessWidget {
  const AlwaysStoppedAnimationScreen({super.key});

  static const routeName = 'animation/AlwaysStoppedAnimation';
  static const title = 'AlwaysStoppedAnimation<T>';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: 'AlwaysStoppedAnimation 是一个停止的动画。当需要值为 Animation<T>'
          '类型，并且是静止的动画，就可以使用 AlwaysStoppedAnimation(value) 来创建。',
      code: _code,
      inheritance: AnimationScreen.routeName,
      properties: [
        ListTile(
          routeName: AlwaysStoppedAnimationStatusScreen.routeName,
          type: 'AnimationStatus',
        ),
        ListTile(
          routeName: AlwaysStoppedAnimationValueScreen.routeName,
          type: 'T',
        ),
      ],
      methods: [
        ListTile(
          name: 'addListener(VoidCallback listener) → void',
          routeName: AlwaysStoppedAnimationAddListenerScreen.routeName,
        ),
        ListTile(
          name: 'addStatusListener(AnimationStatusListener listener) → void',
          routeName: AlwaysStoppedAnimationAddStatusListenerScreen.routeName,
        ),
        ListTile(
          name: 'removeListener(VoidCallback listener) → void',
          routeName: AlwaysStoppedAnimationRemoveListenerScreen.routeName,
        ),
        ListTile(
          name: 'removeStatusListener(AnimationStatusListener listener) → void',
          routeName: AlwaysStoppedAnimationRemoveStatusListenerScreen.routeName,
        ),
        ListTile(
          name: 'toStringDetails() → String',
          routeName: AlwaysStoppedAnimationToStringDetailsScreen.routeName,
        ),
      ],
    );
  }
}
