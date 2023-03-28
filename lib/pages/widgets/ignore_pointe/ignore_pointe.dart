import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  IgnorePointer({
      Key? key,
      bool ignoring = true,
      Widget? child,
      bool? ignoringSemantics,
  })
''';

class IgnorePointerScreen extends ConsumerWidget {
  const IgnorePointerScreen({super.key});

  static const routeName = 'widgets/IgnorePointer';
  static const title = 'IgnorePointer';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: 'IgnorePointer 是一种禁止用户与子部件交互并且可穿透的部件，比如按钮的'
          '点击、输入、ListView的滚动等。如果输入框在输入状态时，ignoring 切换为 true ，输'
          '入框依然可以继续输入。',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileSwitch(
          name: 'ignoring',
          description: '是否禁止用户与子部件交互',
          value: state.ignoring,
          onChanged: notifier.setIgnore,
        ),
        ListTileSwitch(
          name: 'ignoringSemantics',
          description: '是否忽略语义。作用不知。原文档: Whether the semantics of this'
              ' render object is ignored when compiling the semantics tree.',
          value: state.ignoringSemantics,
          onChanged: notifier.setIgnoringSemantics,
        ),
        const ListTileChild(),
      ],
      inheritance: SingleChildRenderObjectWidgetScreen.routeName,
      properties: const [
        ListTile(
          name: 'ignoring → bool',
        ),
        ListTile(
          name: 'ignoringSemantics → bool?',
        ),
      ],
      methods: const [
        ListTile(
          name:
              'createRenderObject(BuildContext context) → RenderIgnorePointer',
        ),
        ListTile(
          name:
              'debugFillProperties(DiagnosticPropertiesBuilder properties) → void',
        ),
        ListTile(
          name:
              'updateRenderObject(BuildContext context, covariant RenderIgnorePointer renderObject) → void',
        ),
      ],
      seeAlso: const [
        ListTile(
          description: '与 IgnorePointer 类似，不可以穿透。',
          routeName: AbsorbPointerScreen.routeName,
        )
      ],
    );
  }
}

final _stateProvider = StateNotifierProvider<_State, _Props>((ref) {
  return _State();
});

class _Props {
  _Props({
    required this.ignoring,
    required this.ignoringSemantics,
  });

  final bool ignoring;
  final bool ignoringSemantics;

  _Props.initial()
      : ignoring = true,
        ignoringSemantics = false;

  _Props initial() => _Props.initial();

  _Props copyWith({
    bool? ignoring,
    bool? ignoringSemantics,
  }) {
    return _Props(
      ignoring: ignoring ?? this.ignoring,
      ignoringSemantics: ignoringSemantics ?? this.ignoringSemantics,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setIgnore(bool value) {
    state = state.copyWith(ignoring: value);
  }

  void setIgnoringSemantics(bool value) {
    state = state.copyWith(ignoringSemantics: value);
  }
}

class _Sample extends StatelessWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    return CupertinoListSection.insetGrouped(
      header: Text('示例', style: theme.textTheme.textStyle),
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            CupertinoButton.filled(
              child: const Text('按钮'),
              onPressed: () {},
            ),
            IgnorePointer(
              ignoring: state.ignoring,
              child: CupertinoButton(
                padding: const EdgeInsets.symmetric(
                  vertical: 60,
                  horizontal: 8,
                ),
                color: CupertinoColors.activeGreen,
                child: Text(state.ignoring ? '穿透' : '按钮'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
