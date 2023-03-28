import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileTextWidthBasis extends ListTilePicker<TextWidthBasis> {
  ListTileTextWidthBasis({
    super.key,
    super.value = TextWidthBasis.parent,
    super.name = 'textWidthBasis',
    super.description = '计算文本宽度时使用的策略',
    super.onSelectedItemChanged,
    super.valueWidth,
  }) : super(
          items: _items,
        );

  static final _items = [
    ListTilePickerItem(
      text: 'TextWidthBasis.parent',
      value: TextWidthBasis.parent,
    ),
    ListTilePickerItem(
      text: 'TextWidthBasis.longestLine',
      value: TextWidthBasis.longestLine,
    ),
  ];
}
