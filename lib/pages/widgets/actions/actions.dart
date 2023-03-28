import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  child: Actions(
    dispatcher: XxxActionDispatcher(),
    actions: { XxxIntent: XxxAction(), ... },
    child: Builder(
      builder: (BuildContext context) {
        ...
        onPressed:
          Actions.handler(context, const XxxIntent())
        ...
      }
    }
  ),
  ...
''';

class ActionsScreen extends ConsumerWidget {
  const ActionsScreen({super.key});

  static const routeName = 'widgets/Actions';
  static const title = 'Actions';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = CupertinoTheme.of(context);

    return PageScaffold(
      title: title,
      explanationChild: RichText(
        text: TextSpan(
          text: 'Actions 是一个把 ',
          style: theme.textTheme.textStyle,
          children: [
            NavigatorLink(
              text: 'ActionDispatcher',
              context: context,
              routeName: ActionDispatcherScreen.routeName,
            ),
            const TextSpan(text: ' 、 '),
            NavigatorLink(
              text: 'Intent',
              context: context,
              routeName: IntentScreen.routeName,
            ),
            const TextSpan(text: ' 和 '),
            NavigatorLink(
              text: 'Action',
              context: context,
              routeName: ActionScreen.routeName,
            ),
            const TextSpan(text: ' 配置在一起的控件，供其后代调用 action 。'),
          ],
        ),
      ),
      code: _code,
      parameters: const [
        ListTile(
          name: 'dispatcher',
          description: '调度器',
          type: 'Dispatcher',
          routeName: ActionDispatcherScreen.routeName,
        ),
        ListTile(
          name: 'actions',
          description: '映射 action',
          type: 'Map<Type, Action<Intent>>',
        ),
        ListTileChild(),
      ],
      inheritance: StatefulWidgetScreen.routeName,
      properties: const [
        ListTile(
          name: 'actions → Map<Type, Action<Intent>>',
        ),
        ListTile(
          name: 'child → Widget',
        ),
        ListTile(
          name: 'dispatcher → ActionDispatcher?',
        ),
      ],
      methods: const [
        ListTile(
          name: 'createState() → State<Actions>',
        ),
        ListTile(
          name:
              'debugFillProperties(DiagnosticPropertiesBuilder properties) → void',
        ),
      ],
      staticMethods: const [
        ListTile(
          name: 'find<T extends Intent>(BuildContext context, {T? intent}) → '
              'Action<T>',
          description: '查找上下文中绑定 intent 的 action，如果找不到抛出异常。',
        ),
        ListTile(
          name: 'maybeFind<T extends Intent>(BuildContext context, {T? intent})'
              ' → Action<T>?',
          description: '查找上下文中绑定 intent 的 action，如果找不到返回 null。',
        ),
        ListTile(
          name: 'handler<T extends Intent>(BuildContext context, T intent) → '
              'VoidCallback?',
          description: '返回一个调用上下文中绑定 intent 的 action 的函数。例子：onTap'
              ': Actions.handler(...)',
        ),
        ListTile(
          name: 'invoke<T extends Intent>(BuildContext context, T intent) → '
              'Object?',
          description: '调用上下文中绑定 intent 的 action.invoke ，如果 action 找不'
              '到抛出异常。例子：onTap: () => Actions.invoke(...)',
        ),
        ListTile(
          name: 'maybeInvoke<T extends Intent>(BuildContext context, T intent) '
              '→ Object?',
          description: '调用上下文中绑定 intent 的 action.invoke ，如果 action 找不'
              '到不会抛出异常。',
        ),
        ListTile(
          name: 'of(BuildContext context) → ActionDispatcher',
          description: '找到上下文中的 ActionDispatcher，如果找不到返回新创建的 '
              'ActionDispatcher',
        ),
      ],
      seeAlso: const [
        ActionDispatcherScreen.routeName,
        ActionScreen.routeName,
        IntentScreen.routeName,
        ShortcutsScreen.routeName,
      ],
    );
  }
}
