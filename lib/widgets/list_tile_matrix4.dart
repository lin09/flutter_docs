import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileMatrix4 extends ListTilePicker<Matrix4> {
  ListTileMatrix4({
    super.key,
    super.value,
    super.name = 'Matrix4',
    super.description = '4D矩阵',
    super.onSelectedItemChanged,
    super.valueWidth,
  }) : super(
          items: _items,
          header: const Text(
            '下面选项只是例子，并非全部',
            style: TextStyle(
              fontSize: 16,
              color: CupertinoColors.secondaryLabel,
            ),
          ),
        );

  static final _items = [
    ListTilePickerItem(
      text: 'Matrix4.rotationZ(0.5)',
      value: Matrix4.rotationZ(0.5),
    ),
    ListTilePickerItem(
      text: 'Matrix4.rotationZ(1)',
      value: Matrix4.rotationZ(1),
    ),
    ListTilePickerItem(
      text: 'Matrix4.rotationZ(1.5)',
      value: Matrix4.rotationZ(1.5),
    ),
  ];
}
