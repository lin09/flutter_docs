import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  // 调用 action
  ActionDispatcher().invokeAction(
    XxxAction(),
    const XxxIntent(),
  );

  // 监听、拦截 Actions 中的 actions
  class XxxActionDispatcher extends ActionDispatcher {
    @override
    Object? invokeAction(
      covariant Action<Intent> action,
      covariant Intent intent, [
      BuildContext? context,
    ]) {
      // 调用拦截到的 action
      super.invokeAction(action, intent, context);
    }
  }
  ...
  Actions(
    dispatcher: XxxActionDispatcher(),
    actions: {...},
    child: (context) => {
      ...
      // 调用方法2
      onPressed: () =>
        Actions.invoke(context, const XxxIntent())
      // 调用方法3
      onPressed:
        Actions.handler(context, const XxxIntent())
      ...
    }
  )
''';

class ActionDispatcherScreen extends StatelessWidget {
  const ActionDispatcherScreen({super.key});

  static const routeName = 'widgets/ActionDispatcher';
  static const title = 'ActionDispatcher';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: 'ActionDispatcher 是操作调度器。用来调用、监听和拦截 action 。',
      code: _code,
      mixedInTypes: [DiagnosticableScreen.routeName],
      methods: [
        ListTile(
          name: 'invokeAction(covariant Action<Intent> action, covariant Intent'
              ' intent, [BuildContext? context]) → Object?',
          description: '调用 action 。',
        ),
      ],
      seeAlso: [
        ShortcutManagerScreen.routeName,
        ShortcutsScreen.routeName,
        ActionsScreen.routeName,
        ActionScreen.routeName,
        IntentScreen.routeName
      ],
    );
  }
}
