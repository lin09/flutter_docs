import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  // Alignment(double x, double y)

  ...
  Container(
    height: 120,
    color: Colors.blue[50],
    child: const Align(
      alignment: Alignment(-0.5, 0.5),
      child: FlutterLogo(size: 60),
    ),
  ),
  ...
''';

class AlignmentScreen extends StatelessWidget {
  const AlignmentScreen({super.key});

  static const routeName = 'painting/Alignment';
  static const title = 'Alignment';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '对齐点 Alignment(x, y)， x 和 y 值范围[0,1]。',
      code: _code,
      parameters: [
        ListTile(
          name: 'x',
          description: 'x 坐标，值 0~1',
          type: 'double',
        ),
        ListTile(
          name: 'y',
          description: 'y 坐标，值 0~1',
          type: 'double',
        ),
      ],
      inheritance: AlignmentGeometryScreen.routeName,
      properties: [
        ListTile(
          name: 'x → double',
        ),
        ListTile(
          name: 'y → double',
        ),
      ],
      methods: [
        ListTile(
          name: 'add(AlignmentGeometry other) → AlignmentGeometry',
        ),
        ListTile(
          name: 'alongOffset(Offset other) → Offset',
          description: '长偏移',
        ),
        ListTile(
          name: 'alongSize(Size other) → Offset',
          description: '长大小。Offset((other.width / 2) * (x + 1), (other.height'
              ' / 2) * (y + 1))',
        ),
        ListTile(
          name: 'inscribe(Size size, Rect rect) → Rect',
          description: '',
          routeName: AlignmentMethodsInscribeScreen.routeName,
        ),
        ListTile(
          name: 'resolve(TextDirection? direction) → Alignment',
        ),
        ListTile(
          name: 'withinRect(Rect rect) → Offset',
          description: '',
        ),
      ],
      operators: [
        ListTile(
          name: 'operator %(double other) → Alignment',
        ),
        ListTile(
          name: 'operator *(double other) → Alignment',
        ),
        ListTile(
          name: 'operator +(Alignment other) → Alignment',
        ),
        ListTile(
          name: 'operator -(Alignment other) → Alignment',
        ),
        ListTile(
          name: 'operator /(double other) → Alignment',
        ),
        ListTile(
          name: 'operator unary-() → Alignment',
        ),
        ListTile(
          name: 'operator ~/(double other) → Alignment',
        ),
      ],
      staticMethods: [
        ListTile(
          name: 'lerp(Alignment? a, Alignment? b, double t) → Alignment?',
        ),
      ],
      constants: [
        ListTile(
          name: 'Alignment.bottomCenter',
          description: '= Alignment(0.0, 1.0)',
        ),
        ListTile(
          name: 'Alignment.bottomLeft',
          description: '= Alignment(-1.0, 1.0)',
        ),
        ListTile(
          name: 'Alignment.bottomRight',
          description: '= Alignment(1.0, 1.0)',
        ),
        ListTile(
          name: 'Alignment.center',
          description: '= Alignment(0.0, 0.0)',
        ),
        ListTile(
          name: 'Alignment.centerLeft',
          description: '= Alignment(-1.0, 0.0)',
        ),
        ListTile(
          name: 'Alignment.centerRight',
          description: '= Alignment(1.0, 0.0)',
        ),
        ListTile(
          name: 'Alignment.topCenter',
          description: '= Alignment(0.0, -1.0)',
        ),
        ListTile(
          name: 'Alignment.topLeft',
          description: '= Alignment(-1.0, -1.0)',
        ),
        ListTile(
          name: 'Alignment.topRight',
          description: '= Alignment(1.0, -1.0)',
        ),
      ],
      seeAlso: [
        AlignmentDirectionalScreen.routeName,
        AlignmentGeometryScreen.routeName,
      ],
    );
  }
}
