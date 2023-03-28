import 'package:flutter/cupertino.dart';

import 'list_tile.dart';

/// [T] : Widget || routeName ， String routeName 。
class ListSection<T> extends StatelessWidget {
  const ListSection(this.children, {super.key, this.title, this.header});

  final String? title;
  final Widget? header;
  final List<T>? children;

  Widget? get _header => this.header ?? (title is String ? Text(title!) : null);

  List<Widget>? get _children {
    if (children == null) return null;

    List<Widget> result = [];

    for (var item in children!) {
      if (item is Widget) {
        result.add(item);
      } else if (item is String) {
        result.add(ListTile(routeName: item));
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection(
      header: _header,
      hasLeading: false,
      children: _children,
    );
  }
}
