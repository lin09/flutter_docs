import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

class BorderRadiusScreen extends StatelessWidget {
  const BorderRadiusScreen({super.key});

  static const routeName = 'painting/BorderRadius';
  static const title = 'BorderRadius';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '边框半径',
      constructors: [
        BorderRadiusAllScreen.routeName,
        BorderRadiusCircularScreen.routeName,
        BorderRadiusHorizontalScreen.routeName,
        BorderRadiusOnlyScreen.routeName,
        BorderRadiusVerticalScreen.routeName,
      ],
      inheritance: BorderRadiusGeometryScreen.routeName,
      properties: [
        ListTile(
          name: 'bottomLeft → Radius',
        ),
        ListTile(
          name: 'bottomRight → Radius',
        ),
        ListTile(
          name: 'topLeft → Radius',
        ),
        ListTile(
          name: 'topRight → Radius',
        ),
      ],
      methods: [
        ListTile(
          name: 'add(BorderRadiusGeometry other) → BorderRadiusGeometry',
        ),
        ListTile(
          name:
              'copyWith({Radius? topLeft, Radius? topRight, Radius? bottomLeft, Radius? bottomRight}) → BorderRadius',
        ),
        ListTile(
          name: 'resolve(TextDirection? direction) → BorderRadius',
        ),
        ListTile(
          name: 'subtract(BorderRadiusGeometry other) → BorderRadiusGeometry',
        ),
        ListTile(
          name: 'toRRect(Rect rect) → RRect',
        ),
      ],
      staticMethods: [
        ListTile(
          name:
              'lerp(BorderRadius? a, BorderRadius? b, double t) → BorderRadius?',
        ),
      ],
      operators: [
        ListTile(
          name: 'operator %(double other) → BorderRadius',
        ),
        ListTile(
          name: 'operator *(double other) → BorderRadius',
        ),
        ListTile(
          name: 'operator +(BorderRadius other) → BorderRadius',
        ),
        ListTile(
          name: 'operator -(BorderRadius other) → BorderRadius',
        ),
        ListTile(
          name: 'operator /(double other) → BorderRadius',
        ),
        ListTile(
          name: 'operator unary-() → BorderRadius',
        ),
        ListTile(
          name: 'operator ~/(double other) → BorderRadius',
        ),
      ],
      constants: [
        ListTile(
          name: 'zero → const BorderRadius',
          description: '= BorderRadius.all(Radius.zero)',
        ),
      ],
    );
  }
}
