import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  child: ActionListener(
    action: XxxAction,
    listener: (action) {
      // 通过在 XxxAction.invoke 调用 notifyActionListeners 来触发监听
    },
    child: ...
  ),
  ...

  class XxxAction extends Action<XxxIntent> {
    @override
    void invoke(covariant XxxIntent intent) {
      // 触发监听
      notifyActionListener();
    }
  }
''';

class ActionListenerScreen extends StatelessWidget {
  const ActionListenerScreen({super.key});

  static const routeName = 'widgets/ActionListener';
  static const title = 'ActionListener';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: title,
      explanation: 'ActionListener 是一个 Action 监听器。',
      code: _code,
      sample: _Sample(),
      parameters: const [
        ListTile(
          name: 'action',
          description: '被监听的 action',
          type: 'Action',
          routeName: ActionScreen.routeName,
        ),
        ListTile(
          name: 'listener',
          description: '监听器',
          type: 'ActionListenerCallback',
        ),
        ListTileChild(),
      ],
      annotations: const [ImmutableConstantScreen.routeName],
      inheritance: StatefulWidgetScreen.routeName,
      properties: const [
        ListTile(
          name: 'action → Action<Intent>',
        ),
        ListTile(
          name: 'child → Widget',
        ),
        ListTile(
          name: 'listener → ActionListenerCallback',
        ),
      ],
      methods: const [
        ListTile(
          name: 'createState() → State<ActionListener>',
        ),
      ],
    );
  }
}

class _Sample extends StatefulWidget {
  @override
  State<_Sample> createState() => _SampleState();
}

class _ActivateAction extends ActivateAction {
  @override
  void invoke(covariant ActivateIntent intent) {
    // 通知 ActionListener ， action 被调用
    notifyActionListeners();
  }
}

class _SampleState extends State<_Sample> {
  int count = 0;

  increment() {
    setState(() {
      ++count;
    });
  }

  final action = _ActivateAction();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            '$count',
            style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          ),
          ActionListener(
            listener: (action) {
              increment();
            },
            action: action,
            child: CupertinoButton.filled(
              onPressed: () => action.invoke(const ActivateIntent()),
              child: const Text('+1'),
            ),
          ),
        ],
      ),
    );
  }
}
