import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  var accumulator = Accumulator();
  ...
  Column(
    children: [
      Text('\${accumulator.value}'),
      CupertinoButton.filled(
        child: const Text('累加'),
        onPressed: () => setState(() {
          accumulator.increment(1);
        }),
      )
    ],
  ),
  ...
''';

class AccumulatorScreen extends StatelessWidget {
  const AccumulatorScreen({super.key});

  static const routeName = 'painting/Accumulator';
  static const title = 'Accumulator';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: title,
      explanation: 'Accumulator 是一个整数累加器',
      code: _code,
      sample: _Sample(),
      parameters: const [
        ListTile(
          name: '[int _value = 0]',
          description: '初始化值',
          type: 'double',
        ),
      ],
      properties: const [
        ListTile(
          name: 'value',
          description: 'accumulator 当前值',
          type: 'double',
        ),
      ],
      methods: const [
        ListTile(
          name: 'increment(int addend) → void',
          description: '累加',
        ),
      ],
    );
  }
}

class _Sample extends StatefulWidget {
  @override
  State<_Sample> createState() => _SampleState();
}

class _SampleState extends State<_Sample> {
  var accumulator = Accumulator();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            '${accumulator.value}',
            style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
          ),
          CupertinoButton.filled(
            child: const Text('累加'),
            onPressed: () => setState(() {
              accumulator.increment(1);
            }),
          )
        ],
      ),
    );
  }
}
