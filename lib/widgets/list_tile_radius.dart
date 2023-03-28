import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileRadius extends ListTilePicker<Radius> {
  ListTileRadius({
    super.key,
    super.value,
    super.name = 'radius',
    super.description = '半径',
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
      text: 'Radius.zero',
      value: Radius.zero,
    ),
    ListTilePickerItem(
      text: 'Radius.circular(8.0)',
      value: const Radius.circular(8.0),
    ),
    ListTilePickerItem(
      text: 'Radius.circular(16.0)',
      value: const Radius.circular(16.0),
    ),
    ListTilePickerItem(
      text: 'Radius.elliptical(8.0, 16.0)',
      value: const Radius.elliptical(8.0, 16.0),
    ),
    ListTilePickerItem(
      text: 'Radius.elliptical(16.0, 8.0)',
      value: const Radius.elliptical(16.0, 8.0),
    ),
  ];
}
