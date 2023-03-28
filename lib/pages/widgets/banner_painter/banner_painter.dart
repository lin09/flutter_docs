import 'package:flutter/cupertino.dart';
import 'package:flutter_docs/pages.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  BannerPainter({required String message,
  required TextDirection textDirection,
  required BannerLocation location,
  required TextDirection layoutDirection,
  Color color = _kColor,
  TextStyle textStyle = _kTextStyle,
  })
''';

class BannerPainterScreen extends ConsumerWidget {
  const BannerPainterScreen({super.key});

  static const routeName = 'widgets/BannerPainter';
  static const title = 'BannerPainter';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const PageScaffold(
      title: title,
      explanation: '标签绘制',
      code: _code,
      parameters: [
        ListTile(
          name: 'textDirection',
          description: '文字方向',
          type: 'TextDirection',
        ),
        ListTile(
          name: 'location',
          description: '标签位置',
          type: 'BannerLocation',
        ),
        ListTile(
          name: 'layoutDirection',
          description: '布局方向',
          type: 'TextDirection',
        ),
        ListTile(
          name: 'message',
          description: '标签的文字',
          type: 'String',
        ),
        ListTile(
          name: 'textStyle',
          description: '文字样式',
          type: 'TextStyle',
        ),
        ListTile(
          name: 'color',
          description: '背景颜色',
          type: 'TextStyle',
        ),
      ],
      inheritance: CustomPainterScreen.routeName,
      properties: [
        ListTile(
          name: 'color → Color',
        ),
        ListTile(
          name: 'layoutDirection → TextDirection',
        ),
        ListTile(
          name: 'location → BannerLocation',
        ),
        ListTile(
          name: 'message → String',
        ),
        ListTile(
          name: 'textDirection → TextDirection',
        ),
        ListTile(
          name: 'textStyle → TextStyle',
        ),
      ],
      methods: [
        ListTile(
          name: 'dispose() → void',
        ),
        ListTile(
          name: 'hitTest(Offset position) → bool',
        ),
        ListTile(
          name: 'paint(Canvas canvas, Size size) → void',
        ),
        ListTile(
          name: 'shouldRepaint(covariant BannerPainter oldDelegate) → bool',
        ),
      ],
    );
  }
}
