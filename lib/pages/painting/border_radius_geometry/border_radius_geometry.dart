import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

class BorderRadiusGeometryScreen extends StatelessWidget {
  const BorderRadiusGeometryScreen({super.key});

  static const routeName = 'painting/BorderRadiusGeometry';
  static const title = 'BorderRadiusGeometry';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '边框半径的基础抽象类',
      annotations: [ImmutableConstantScreen.routeName],
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
      operators: [
        ListTile(
          name: 'operator %(double other) → BorderRadiusGeometry',
        ),
        ListTile(
          name: 'operator *(double other) → BorderRadiusGeometry',
        ),
        ListTile(
          name: 'operator /(double other) → BorderRadiusGeometry',
        ),
        ListTile(
          name: 'operator unary-() → BorderRadiusGeometry',
        ),
        ListTile(
          name: 'operator ~/(double other) → BorderRadiusGeometry',
        ),
      ],
      staticMethods: [
        ListTile(
          name:
              'lerp(BorderRadiusGeometry? a, BorderRadiusGeometry? b, double t) → BorderRadiusGeometry?',
        ),
      ],
      implementers: [
        BorderRadiusScreen.routeName,
        BorderRadiusDirectionalScreen.routeName,
      ],
    );
  }
}
