import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileTextAlign extends ListTilePicker<TextAlign> {
  ListTileTextAlign({
    super.key,
    super.value,
    super.name = 'TextAlign',
    super.description = '文本样式',
    super.onSelectedItemChanged,
    super.valueWidth,
  }) : super(
          items: _items,
        );

  static final _items = [
    ListTilePickerItem(
      text: 'TextAlign.center',
      value: TextAlign.center,
    ),
    ListTilePickerItem(
      text: 'TextAlign.end',
      value: TextAlign.end,
    ),
    ListTilePickerItem(
      text: 'TextAlign.justify',
      value: TextAlign.justify,
    ),
    ListTilePickerItem(
      text: 'TextAlign.left',
      value: TextAlign.left,
    ),
    ListTilePickerItem(
      text: 'TextAlign.right',
      value: TextAlign.right,
    ),
    ListTilePickerItem(
      text: 'TextAlign.start',
      value: TextAlign.start,
    ),
  ];
}
