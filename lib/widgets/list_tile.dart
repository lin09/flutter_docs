import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/router.dart';

RegExp _routeNameRE = RegExp(r'.+\/');

class ListTile extends StatefulWidget {
  const ListTile({
    super.key,
    this.name,
    this.description,
    this.type,
    this.typeWidth,
    this.trailing,
    this.trailingBuilder,
    this.routeName,
    this.onTap,
  });

  final String? name;
  final Widget? trailing;
  final Widget Function(BuildContext context)? trailingBuilder;
  final String? description;
  final String? type;
  final double? typeWidth;
  final String? routeName;
  final void Function()? onTap;

  @override
  State<ListTile> createState() => ListTileState();
}

class ListTileState<T extends ListTile> extends State<T> {
  Widget? trailing;
  Function()? onTap;

  setTrailing(Widget? value) {
    setState(() {
      trailing = value;
    });
  }

  setOnTap(Function()? value) {
    setState(() {
      onTap = value;
    });
  }

  void Function()? get _onTap {
    var result = onTap ?? widget.onTap;

    if (result is Function) return result;

    if (widget.routeName is String) {
      return () {
        String routeName = widget.routeName!;
        if (AppRouter.hasName(routeName)) {
          Navigator.of(context).pushNamed(routeName);
        } else {
          debugPrint('No route exists: $routeName');
        }
      };
    }

    return null;
  }

  Widget? get _trailing {
    Widget? res;

    if (widget.type is String) {
      res = SizedBox(
        width: widget.typeWidth,
        child: Text(
          widget.type!,
          style: CupertinoTheme.of(context).textTheme.textStyle,
          maxLines: 10,
        ),
      );
    } else {
      res =
          trailing ?? widget.trailing ?? widget.trailingBuilder?.call(context);
    }

    if (_onTap != null) {
      var chevron = const CupertinoListTileChevron();
      res = res is Widget ? Row(children: [res, chevron]) : chevron;
    }

    return res;
  }

  Widget? get _subtitle {
    if (widget.description is String) {
      return Text(
        widget.description!,
        maxLines: 10,
      );
    }
    return null;
  }

  String get _name =>
      widget.name ?? widget.routeName?.replaceAll(_routeNameRE, '') ?? '';

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
      title: Text(_name, maxLines: 5),
      subtitle: _subtitle,
      trailing: _trailing,
      onTap: _onTap,
    );
  }
}
