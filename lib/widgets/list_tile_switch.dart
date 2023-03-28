import 'package:flutter/cupertino.dart';

import 'list_tile.dart';

class ListTileSwitch extends ListTile {
  ListTileSwitch({
    super.key,
    required super.name,
    super.description,
    required this.value,
    required this.onChanged,
  }) : super(
          trailing: CupertinoSwitch(
            value: value,
            onChanged: onChanged,
          ),
        );

  final bool value;
  final ValueChanged<bool> onChanged;
}
