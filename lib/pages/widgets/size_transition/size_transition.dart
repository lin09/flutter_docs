import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class SizeTransitionScreen extends ConsumerWidget {
  const SizeTransitionScreen({super.key});

  static const routeName = 'widgets/SizeTransition';
  static const title = 'SizeTransition';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [],
      inheritance: routeName,
      properties: const [],
      methods: const [],
      staticMethods: const [],
    );
  }
}

final _stateProvider = StateNotifierProvider<_State, _Props>((ref) {
  return _State();
});

class _Props {
  _Props({
    required this.name,
  });

  final String name;

  _Props.initial() : name = '';

  _Props initial() => _Props.initial();

  _Props copyWith({
    String? name,
  }) {
    return _Props(
      name: name ?? this.name,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setName(String value) {
    state = state.copyWith(name: value);
  }
}

class _Sample extends StatefulWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  State<_Sample> createState() => _SampleState();
}

class _SampleState extends State<_Sample> {
  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    return Text(state.name);
  }
}
