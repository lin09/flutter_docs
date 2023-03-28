import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  AbsorbPointer({
      Key? key,
      bool absorbing = true,
      Widget? child,
      bool? ignoringSemantics,
  })
''';

class AbsorbPointerScreen extends ConsumerWidget {
  const AbsorbPointerScreen({super.key});

  static const routeName = 'widgets/AbsorbPointer';
  static const title = 'AbsorbPointer';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: 'AbsorbPointer 是一种禁止用户与子部件交互的部件，比如按钮的点击、输入'
          '框的输入、ListView的滚动等。如果输入框在输入状态时，absorbing 切换为 true ，输'
          '入框依然可以继续输入。',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileSwitch(
          value: state.absorbing,
          onChanged: notifier.setAbsorbing,
          name: 'absorbing',
          description: '是否禁止用户与子部件交互',
        ),
        ListTileSwitch(
          value: state.ignoringSemantics,
          onChanged: notifier.setIgnoringSemantics,
          name: 'ignoringSemantics',
          description: '是否忽略语义。作用不知。原文档: Whether the semantics of this '
              'render object is ignored when compiling the semantics tree.',
        ),
        const ListTileChild(),
      ],
      inheritance: SingleChildRenderObjectWidgetScreen.routeName,
      properties: const [
        ListTile(
          routeName: AbsorbPointerAbsorbingScreen.routeName,
          type: 'bool',
          description: '是否已禁止用户与子部件交互',
        ),
        ListTile(
          routeName: AbsorbPointerIgnoringSemanticsScreen.routeName,
          type: 'bool',
          description: '是否已忽略语义',
        ),
      ],
      methods: const [
        ListTile(
          routeName: AbsorbPointerCreateRenderObjectScreen.routeName,
        ),
        ListTile(
          routeName: AbsorbPointerDebugFillPropertiesScreen.routeName,
        ),
        ListTile(
          routeName: AbsorbPointerUpdateRenderObjectScreen.routeName,
        ),
      ],
      seeAlso: const [
        ListTile(
          routeName: IgnorePointerScreen.routeName,
          description: '与 AbsorbPointer 类似，可以穿透。',
        ),
      ],
    );
  }
}

final _stateProvider = StateNotifierProvider<_State, _Props>((ref) {
  return _State();
});

class _Props {
  _Props({
    required this.absorbing,
    required this.ignoringSemantics,
  });

  final bool absorbing;
  final bool ignoringSemantics;

  _Props.initial()
      : absorbing = true,
        ignoringSemantics = false;

  _Props initial() => _Props.initial();

  _Props copyWith({
    bool? absorbing,
    bool? ignoringSemantics,
  }) {
    return _Props(
      absorbing: absorbing ?? this.absorbing,
      ignoringSemantics: ignoringSemantics ?? this.ignoringSemantics,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setAbsorbing(bool value) {
    state = state.copyWith(absorbing: value);
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
    return CupertinoListSection(
      header: Text(
        state.absorbing ? '示例: 不可以点击' : '示例: 可以点击',
      ),
      children: [
        CupertinoListTile.notched(
          padding: const EdgeInsets.all(10),
          title: AbsorbPointer(
            absorbing: state.absorbing,
            child: CupertinoTextField(
              placeholder: '请输入到账金额',
              suffix: CupertinoButton(
                padding: const EdgeInsets.all(8),
                minSize: 0,
                child: const Text('转入银行卡'),
                onPressed: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }
}
