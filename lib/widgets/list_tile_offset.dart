import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileOffset extends ListTilePicker<Offset> {
  ListTileOffset({
    super.key,
    super.value,
    super.name = 'offset',
    super.description = '目标偏移量。水平平移: 宽度*dx，垂直平移: 高度*dy',
    super.onSelectedItemChanged,
    super.valueWidth,
  }) : super(
          items: _items,
        );

  static final _items = [
    ListTilePickerItem(
      text: 'Offset.zero',
      value: Offset.zero,
    ),
    ListTilePickerItem(
      text: 'Offset(0.5, 0.5)',
      value: const Offset(0.5, 0.5),
    ),
    ListTilePickerItem(
      text: 'Offset(1, 1)',
      value: const Offset(1, 1),
    ),
    ListTilePickerItem(
      text: 'Offset(-0.5, -0.5)',
      value: const Offset(-0.5, -0.5),
    ),
    ListTilePickerItem(
      text: 'Offset(-1, -1)',
      value: const Offset(-1, -1),
    ),
    ListTilePickerItem(
      text: 'Offset(0.5, -0.5)',
      value: const Offset(0.5, -0.5),
    ),
    ListTilePickerItem(
      text: 'Offset(1, -1)',
      value: const Offset(1, -1),
    ),
    ListTilePickerItem(
      text: 'Offset(-0.5, 0.5)',
      value: const Offset(-0.5, 0.5),
    ),
    ListTilePickerItem(
      text: 'Offset(-1, 1)',
      value: const Offset(-1, 1),
    ),
    ListTilePickerItem(
      text: 'Offset(-1, 0)',
      value: const Offset(-1, 0),
    ),
  ];
}
