import 'package:flutter/cupertino.dart';
import 'package:flutter_docs/pages.dart';

import 'package:flutter_docs/widgets.dart';

class BackButtonDispatcherScreen extends StatelessWidget {
  const BackButtonDispatcherScreen({super.key});

  static const routeName = 'widgets/BackButtonDispatcher';
  static const title = 'BackButtonDispatcher';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '一个抽象类，监听后退按钮的点击事件。',
      implementers: [
        ChildBackButtonDispatcherScreen.routeName,
        RootBackButtonDispatcherScreen.routeName,
      ],
      parameters: [
        ListTile(
          name: 'hasCallbacks → bool',
        ),
      ],
      methods: [
        ListTile(
          name: 'createChildBackButtonDispatcher() → ChildBackButtonDispatcher',
        ),
        ListTile(
          name: 'deferTo(ChildBackButtonDispatcher child) → void',
        ),
        ListTile(
          name: 'forget(ChildBackButtonDispatcher child) → void',
        ),
        ListTile(
          name: 'invokeCallback(Future<bool> defaultValue) → Future<bool>',
        ),
        ListTile(
          name: 'takePriority() → void',
        ),
      ],
    );
  }
}
