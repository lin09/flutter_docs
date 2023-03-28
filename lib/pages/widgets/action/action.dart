import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  Action()

  Action.overridable({
    required Action<T> defaultAction,
    required BuildContext context
  })

  /// 使用
  class XxxAction extends Action<XxxIntent> {
    const XxxAction();

    // 调用时运行
    @override
    void invoke(covariant XxxIntent intent) {
      ...
    }
  }

  class XxxIntent extents Intent {
    const XxxIntent();
  }

  // 调用方法1
  XxxAction().invoke(const XxxIntent());

  // 调用方法2
  ActionDispatcher().invokeAction(
    XxxAction(),
    const XxxIntent(),
  );

  // 在 Actions 中使用
  child: Actions(
    actions: { XxxIntent: XxxAction() },
    child: Builder(
      builder: (BuildContext context) {
        ...
        // 调用方法3
        onPressed: () =>
          Actions.invoke(context, const XxxIntent()),
        // 调用方法4
        onPressed:
          Actions.handler(context, const XxxIntent()),
        ...
      },
    ),
  )

  // 在 Shortcuts 中使用
  child: Shortcuts(
    shortcuts: <LogicalKeySet, Intent>{
      LogicalKeySet(LogicalKeyboardKey.escape):
        const XxxIntent(),
    },
    ...
  )
''';

class ActionScreen extends StatelessWidget {
  const ActionScreen({super.key});

  static const routeName = 'widgets/Action';
  static const title = 'Action<T extends Intent>';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: title,
      explanation: 'Action 是一个抽象的 actions 类。与其他语言框架的 action 作用差不多。',
      code: _code,
      sample: _Sample(),
      properties: const [
        ListTile(
          name: 'callingAction → Action<T>?',
        ),
        ListTile(
          name: 'intentType → Type',
        ),
        ListTile(
          name: 'isActionEnabled → bool',
        ),
      ],
      mixedInTypes: const [DiagnosticableScreen.routeName],
      parameters: const [
        ListTile(
          name: 'callingAction → Action<T>?',
        ),
        ListTile(
          name: 'intentType → Type',
        ),
        ListTile(
          name: 'isActionEnabled → bool',
        ),
      ],
      methods: const [
        ListTile(
          name: 'addActionListener(ActionListenerCallback listener) → void',
          description: '添加监听器。必须调用 removeActionListener 匹配的次数，否则将发'
              '生内存泄漏。为了帮助管理这一点并避免内存泄漏，强烈建议使用 ActionListener '
              '部件来使用监听。',
        ),
        ListTile(
          name: 'removeActionListener(ActionListenerCallback listener) → void',
          description: '删除监听器。',
        ),
        ListTile(
          name: 'consumesKey(T intent) → bool',
          description: '指示当通过键事件调用此操作时，是否应将映射到此操作的键事件视为'
              '“handled”。',
        ),
        ListTile(
          name: 'invoke(T intent) → Object?',
          description: '在执行 action 时调用。',
        ),
        ListTile(
          name: 'isEnabled(T intent) → bool',
          description: '如果 action 已启用并准备好调用，则返回true。',
        ),
        ListTile(
          name: 'notifyActionListeners() → void',
          description: '调用所有注册的监听器。',
        ),
      ],
      implementers: const [
        ActivateActionScreen.routeName,
        CallbackActionScreen.routeName,
        ContextActionScreen.routeName,
        DirectionalFocusActionScreen.routeName,
        DismissActionScreen.routeName,
        DoNothingActionScreen.routeName,
        NextFocusActionScreen.routeName,
        PreviousFocusActionScreen.routeName,
        PrioritizedActionScreen.routeName,
        RequestFocusActionScreen.routeName,
        ScrollActionScreen.routeName,
        SelectActionScreen.routeName,
        VoidCallbackActionScreen.routeName,
      ],
      seeAlso: const [
        ShortcutsScreen.routeName,
        ActionsScreen.routeName,
        ActionDispatcherScreen.routeName,
        ActionOverridableScreen.routeName,
      ],
    );
  }
}

class _Sample extends StatefulWidget {
  @override
  State<_Sample> createState() => _SampleState();
}

class _SampleState extends State<_Sample> {
  var model = _Model();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          AnimatedBuilder(
            animation: model.data,
            builder: (context, child) => Text(
              '${model.data.value}',
              style:
                  CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
            ),
          ),
          CupertinoButton.filled(
            child: const Text('+1'),
            onPressed: () =>
                _IncrementAction(model).invoke(const _IncrementIntent()),
          ),
        ],
      ),
    );
  }
}

class _Model {
  ValueNotifier<int> data = ValueNotifier<int>(0);

  void increment() {
    ++data.value;
  }
}

class _IncrementIntent extends Intent {
  const _IncrementIntent();
}

class _IncrementAction extends Action<_IncrementIntent> {
  _IncrementAction(this.model);

  final _Model model;

  @override
  void invoke(covariant _IncrementIntent intent) {
    ++model.data.value;
  }
}
