import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  Rect inscribe(Size size, Rect rect) {
    final double halfWidthDelta =
        (rect.width - size.width) / 2.0;
    final double halfHeightDelta =
        (rect.height - size.height) / 2.0;
    return Rect.fromLTWH(
      rect.left + halfWidthDelta + x * halfWidthDelta,
      rect.top + halfHeightDelta + y * halfHeightDelta,
      size.width,
      size.height,
    );
  }
''';

class AlignmentMethodsInscribeScreen extends StatelessWidget {
  const AlignmentMethodsInscribeScreen({super.key});

  static const routeName = 'painting/Alignment/inscribe';
  static const title = 'Alignment inscribe method';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '返回一个给定大小的矩形，该矩形在该对齐方式指定的给定矩形内对齐。\n\n'
          '例如，使用 Alignment.topLeft 在 200x200 矩形上的 100x100 大小将是 200x200'
          ' 长方形左上角的 100x200 长方形。',
      code: _code,
      parameters: [
        ListTile(
          name: 'size',
          type: 'Size',
          routeName: SizeScreen.routeName,
        ),
        ListTile(
          name: 'rect',
          type: 'Rect',
          routeName: RectScreen.routeName,
        ),
      ],
      seeAlso: [RectScreen.routeName],
    );
  }
}
