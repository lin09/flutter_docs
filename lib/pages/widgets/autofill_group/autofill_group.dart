import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  AutofillGroup(
    child: Column(
      children: [
        CupertinoTextField(
          placeholder: 'username',
          controller: username,
          autofillHints: const [AutofillHints.username],
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 10),
        CupertinoTextField(
          placeholder: 'password',
          obscureText: true,
          controller: password,
          autofillHints: const [AutofillHints.password],
          onEditingComplete: () {
            TextInput.finishAutofillContext();
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  )
''';

class AutofillGroupScreen extends ConsumerWidget {
  const AutofillGroupScreen({super.key});

  static const routeName = 'widgets/AutofillGroup';
  static const title = 'AutofillGroup';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '自动填充分组。（没搞懂这部件）',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileAutofillContextAction(
          name: 'onDisposeAction',
          description: '清理当前的自动填充上下文',
          valueWidth: 164,
          value: state.onDisposeAction,
          onSelectedItemChanged: notifier.setOnDisposeAction,
        ),
        const ListTileChild(),
      ],
      inheritance: StatefulWidgetScreen.routeName,
      properties: const [
        ListTile(
          name: 'child → Widget',
        ),
        ListTile(
          name: 'onDisposeAction → AutofillContextAction',
        ),
      ],
      methods: const [
        ListTile(
          name: 'createState() → AutofillGroupState',
        ),
      ],
      staticMethods: const [
        ListTile(
          name: 'maybeOf(BuildContext context) → AutofillGroupState?',
        ),
        ListTile(
          name: 'of(BuildContext context) → AutofillGroupState',
        ),
      ],
    );
  }
}

class _Sample extends StatefulWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  State<_Sample> createState() => _SampleState();
}

class _SampleState extends State<_Sample> {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    username.dispose();
    password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: AutofillGroup(
        onDisposeAction: state.onDisposeAction,
        child: Column(
          children: [
            CupertinoTextField(
              placeholder: 'username',
              controller: username,
              autofillHints: const [AutofillHints.username],
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 10),
            CupertinoTextField(
              placeholder: 'password',
              obscureText: true,
              controller: password,
              autofillHints: const [AutofillHints.password],
              onEditingComplete: () {
                TextInput.finishAutofillContext();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

final _stateProvider = StateNotifierProvider<_State, _Props>((ref) {
  return _State();
});

class _Props {
  _Props({
    required this.onDisposeAction,
  });

  final AutofillContextAction onDisposeAction;

  _Props.initial() : onDisposeAction = AutofillContextAction.commit;

  _Props initial() => _Props.initial();

  _Props copyWith({
    AutofillContextAction? onDisposeAction,
  }) {
    return _Props(
      onDisposeAction: onDisposeAction ?? this.onDisposeAction,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setOnDisposeAction(AutofillContextAction value) {
    state = state.copyWith(onDisposeAction: value);
  }
}
