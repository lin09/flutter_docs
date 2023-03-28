import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileAlignment extends ListTilePicker<AlignmentGeometry> {
  ListTileAlignment({
    super.key,
    super.value = Alignment.topCenter,
    super.name = 'alignment',
    super.description = '对齐方式',
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
      text: 'Alignment.topLeft',
      value: Alignment.topLeft,
    ),
    ListTilePickerItem(
      text: 'Alignment.topCenter',
      value: Alignment.topCenter,
    ),
    ListTilePickerItem(
      text: 'Alignment.topRight',
      value: Alignment.topRight,
    ),
    ListTilePickerItem(
      text: 'Alignment.centerLeft',
      value: Alignment.centerLeft,
    ),
    ListTilePickerItem(
      text: 'Alignment.center',
      value: Alignment.center,
    ),
    ListTilePickerItem(
      text: 'Alignment.centerRight',
      value: Alignment.centerRight,
    ),
    ListTilePickerItem(
      text: 'Alignment.bottomLeft',
      value: Alignment.bottomLeft,
    ),
    ListTilePickerItem(
      text: 'Alignment.bottomCenter',
      value: Alignment.bottomCenter,
    ),
    ListTilePickerItem(
      text: 'Alignment.bottomRight',
      value: Alignment.bottomRight,
    ),
    ListTilePickerItem(
      text: 'Alignment(-0.5, 0.5)',
      value: const Alignment(-0.5, 0.5),
    ),
  ];
}
