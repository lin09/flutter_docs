import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileTextStyle extends ListTilePicker<TextStyle> {
  ListTileTextStyle({
    super.key,
    super.value,
    super.name = 'TextStyle',
    super.description = '文本样式',
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
      text: 'actionTextStyle',
      value: const TextStyle(
        color: CupertinoColors.activeBlue,
        fontSize: 14,
      ),
    ),
    ListTilePickerItem(
      text: 'navLargeTitleTextStyle',
      value: const TextStyle(
        color: CupertinoColors.activeOrange,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    ),
  ];
}
