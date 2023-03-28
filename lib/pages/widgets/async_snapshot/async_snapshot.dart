import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  AsyncSnapshot.nothing()

  AsyncSnapshot.waiting()

  AsyncSnapshot.withData(ConnectionState state, T data)

  AsyncSnapshot.withError(
    ConnectionState state,
    Object error,
    [StackTrace stackTrace = StackTrace.empty]
  )
''';

class AsyncSnapshotScreen extends ConsumerWidget {
  const AsyncSnapshotScreen({super.key});

  static const routeName = 'widgets/AsyncSnapshot';
  static const title = 'AsyncSnapshot<T>';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const PageScaffold(
      title: title,
      explanation: '异步任务的状态信息及结果信息',
      code: _code,
      parameters: [
        ListTile(
          name: 'state',
          description: '异步状态',
          type: 'ConnectionState',
        ),
        ListTile(
          name: 'data',
          description: '数据',
          type: 'T',
        ),
        ListTile(
          name: 'error',
          description: '错误信息',
          type: 'Object',
        ),
        ListTile(
          name: 'stackTrace',
          description: '堆栈',
          type: 'StackTrace',
        ),
      ],
      annotations: [ImmutableConstantScreen.routeName],
      properties: [
        ListTile(
          name: 'connectionState → ConnectionState',
          description: '异步当前状态',
        ),
        ListTile(
          name: 'data → T?',
          description: '最新数据',
        ),
        ListTile(
          name: 'error → Object?',
          description: '错误信息',
        ),
        ListTile(
          name: 'hasData → bool',
          description: '是否有数据',
        ),
        ListTile(
          name: 'hasError → bool',
          description: '是否有错误',
        ),
        ListTile(
          name: 'requireData → T',
          description: '最新数据，如果没有数据会报错',
        ),
        ListTile(
          name: 'stackTrace → StackTrace?',
          description: '堆栈跟踪数据',
        ),
      ],
      methods: [
        ListTile(
          name: 'inState(ConnectionState state) → AsyncSnapshot<T>',
          description: '指定状态，返回新的 AsyncSnapshot<T>',
        ),
      ],
      seeAlso: [
        StreamBuilderScreen.routeName,
        FutureBuilderScreen.routeName,
      ],
    );
  }
}
