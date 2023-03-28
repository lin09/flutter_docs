import 'package:flutter/cupertino.dart';

import 'list_section.dart';

/// [route] : Widget || routeName ， String routeName 。
class Inheritance<T> extends StatelessWidget {
  const Inheritance(this.route, {super.key});

  final T route;

  @override
  Widget build(BuildContext context) {
    return ListSection(
      title: '继承 inheritance',
      [route],
    );
  }
}
