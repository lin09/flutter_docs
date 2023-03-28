import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileColor extends ListTilePicker<Color> {
  ListTileColor({
    super.key,
    super.value,
    super.name = 'color',
    super.description = '颜色',
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
      text: 'CupertinoColors.activeBlue',
      value: CupertinoColors.activeBlue,
    ),
    ListTilePickerItem(
      text: 'CupertinoColors.activeGreen',
      value: CupertinoColors.activeGreen,
    ),
    ListTilePickerItem(
      text: 'CupertinoColors.activeOrange',
      value: CupertinoColors.activeOrange,
    ),
    ListTilePickerItem(
      text: 'CupertinoColors.black',
      value: CupertinoColors.black,
    ),
    ListTilePickerItem(
      text: 'CupertinoColors.white',
      value: CupertinoColors.white,
    ),
    ListTilePickerItem(
      text: 'CupertinoColors.systemIndigo',
      value: CupertinoColors.systemIndigo,
    ),
    ListTilePickerItem(
      text: 'CupertinoColors.systemPink',
      value: CupertinoColors.systemPink,
    ),
    ListTilePickerItem(
      text: 'CupertinoColors.systemPurple',
      value: CupertinoColors.systemPurple,
    ),
  ];
}
