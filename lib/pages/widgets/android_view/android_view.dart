import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  AndroidView({
    Key? key,
    required String viewType,
    PlatformViewCreatedCallback?
        onPlatformViewCreated,
    PlatformViewHitTestBehavior hitTestBehavior =
        PlatformViewHitTestBehavior.opaque,
    TextDirection? layoutDirection,
    Set<Factory<OneSequenceGestureRecognizer>>?
        gestureRecognizers,
    dynamic creationParams,
    MessageCodec? creationParamsCodec,
    Clip clipBehavior = Clip.hardEdge,
  }),
  ...
''';

class AndroidViewScreen extends ConsumerWidget {
  const AndroidViewScreen({super.key});

  static const routeName = 'widgets/AndroidView';
  static const title = 'AndroidView';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const PageScaffold(
      title: title,
      explanation: 'AndroidView 部件用于在 Widget 层次结构中嵌入 Android 视图。嵌入 '
          'Android 视图是个性能较差的方法，在可能使用 Flutter 等效工具时应避免使用。',
      code: _code,
      parameters: [
        ListTile(
          name: 'viewType',
          description: '要嵌入的 Android 视图类型的唯一标识符。',
          type: 'String',
        ),
        ListTile(
          name: 'onPlatformViewCreated',
          description: '创建平台视图后调用的回调。',
          type: 'PlatformViewCreatedCallback',
          typeWidth: 150,
        ),
        ListTile(
          name: 'hitTestBehavior',
          description: '命中测试期间的行为。',
          type: 'PlatformViewHitTestBehavior',
          typeWidth: 150,
        ),
        ListTile(
          name: 'layoutDirection',
          description: '用于嵌入视图的文本方向。',
          type: 'TextDirection',
        ),
        ListTile(
          name: 'gestureRecognizers',
          description: '哪些手势应转发到 Android 视图。',
          type: 'Set<Factory<OneSequenceGestureRecognizer>>',
          typeWidth: 150,
        ),
        ListTile(
          name: 'creationParams',
          description: '作为 PlatformViewFactory#create 的 args 参数传递',
          type: 'dynamic',
        ),
        ListTile(
          name: 'creationParamsCodec',
          description: '用于在将 creationParams 发送到平台端之前对其进行编码的编解码器。'
              '它应该与传递给 PlatformViewFactory 构造函数的编解码器匹配。',
          type: 'MessageCodec',
        ),
        ListTile(
          name: 'clipBehavior',
          description: '将根据此选项剪裁（或不剪裁）内容。',
          type: 'Clip',
        ),
      ],
      inheritance: StatefulWidgetScreen.routeName,
      properties: [
        ListTile(
          name: 'clipBehavior → Clip',
        ),
        ListTile(
          name: 'creationParams → dynamic',
        ),
        ListTile(
          name: 'creationParamsCodec → MessageCodec?',
        ),
        ListTile(
          name:
              'gestureRecognizers → Set<Factory<OneSequenceGestureRecognizer>>?',
        ),
        ListTile(
          name: 'hitTestBehavior → PlatformViewHitTestBehavior',
        ),
        ListTile(
          name: 'layoutDirection → TextDirection?',
        ),
        ListTile(
          name: 'onPlatformViewCreated → PlatformViewCreatedCallback?',
        ),
        ListTile(
          name: 'viewType → String',
        ),
      ],
      methods: [
        ListTile(
          name: 'createState() → State<AndroidView>',
        ),
      ],
    );
  }
}
