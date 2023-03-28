import 'package:flutter/cupertino.dart';

import 'list_tile.dart';

class Return extends StatelessWidget {
  const Return(this.routeName, {super.key});

  final String routeName;

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection(
      header: const Text('返回值'),
      children: [
        ListTile(routeName: routeName),
      ],
    );
  }
}
