import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

class BorderRadiusDirectionalScreen extends StatelessWidget {
  const BorderRadiusDirectionalScreen({super.key});

  static const routeName = 'painting/BorderRadiusDirectional';
  static const title = 'BorderRadiusDirectional';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '边框半径',
      constructors: [
        BorderRadiusDirectionalAllScreen.routeName,
        BorderRadiusDirectionalCircularScreen.routeName,
        BorderRadiusDirectionalHorizontalScreen.routeName,
        BorderRadiusDirectionalOnlyScreen.routeName,
        BorderRadiusDirectionalVerticalScreen.routeName,
      ],
      inheritance: BorderRadiusGeometryScreen.routeName,
      properties: [
        ListTile(
          name: 'bottomStart → Radius',
        ),
        ListTile(
          name: 'bottomEnd → Radius',
        ),
        ListTile(
          name: 'topStart → Radius',
        ),
        ListTile(
          name: 'topEnd → Radius',
        ),
      ],
      methods: [
        ListTile(
          name: 'add(BorderRadiusGeometry other) → BorderRadiusGeometry',
        ),
        ListTile(
          name: 'resolve(TextDirection? direction) → BorderRadius',
        ),
        ListTile(
          name: 'subtract(BorderRadiusGeometry other) → BorderRadiusGeometry',
        ),
      ],
      staticMethods: [
        ListTile(
          name:
              'lerp(BorderRadiusDirectional? a, BorderRadiusDirectional? b, double t) → BorderRadiusDirectional?',
        ),
      ],
      operators: [
        ListTile(
          name: 'operator %(double other) → BorderRadiusDirectional',
        ),
        ListTile(
          name: 'operator *(double other) → BorderRadiusDirectional',
        ),
        ListTile(
          name:
              'operator +(BorderRadiusDirectional other) → BorderRadiusDirectional',
        ),
        ListTile(
          name:
              'operator -(BorderRadiusDirectional other) → BorderRadiusDirectional',
        ),
        ListTile(
          name: 'operator /(double other) → BorderRadiusDirectional',
        ),
        ListTile(
          name: 'operator unary-() → BorderRadiusDirectional',
        ),
        ListTile(
          name: 'operator ~/(double other) → BorderRadiusDirectional',
        ),
      ],
      constants: [
        ListTile(
          name: 'zero → const BorderRadiusDirectional',
          description: '= BorderRadiusDirectional.all(Radius.zero)',
        ),
      ],
    );
  }
}
