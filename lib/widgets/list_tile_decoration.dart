import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileDecoration extends ListTilePicker<Decoration> {
  ListTileDecoration({
    super.key,
    super.value,
    super.name = 'decoration',
    super.description = '背景装饰',
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
      text: '...eBlue, ...rRadius.circular(6)...',
      value: BoxDecoration(
        color: CupertinoColors.activeBlue,
        borderRadius: BorderRadius.circular(6),
      ),
    ),
    ListTilePickerItem(
      text: '...eGreen, ...rRadius.circular(12)...',
      value: BoxDecoration(
        color: CupertinoColors.activeGreen,
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    ListTilePickerItem(
      text: '...eOrange, ...rRadius.circular(999)...',
      value: BoxDecoration(
        color: CupertinoColors.activeOrange,
        borderRadius: BorderRadius.circular(999),
      ),
    ),
    ListTilePickerItem(
      text: '...Color(0x8f000000)...',
      value: const BoxDecoration(
        color: Color(0x8f000000),
      ),
    ),
  ];
}
