import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileTextOverflow extends ListTilePicker<TextOverflow> {
  ListTileTextOverflow({
    super.key,
    super.value = TextOverflow.clip,
    super.name = 'overflow',
    super.description = '文本溢出设置',
    super.onSelectedItemChanged,
    super.valueWidth,
  }) : super(
          items: _items,
        );

  static final _items = [
    ListTilePickerItem(
      text: 'TextOverflow.clip',
      value: TextOverflow.clip,
    ),
    ListTilePickerItem(
      text: 'TextOverflow.ellipsis',
      value: TextOverflow.ellipsis,
    ),
    ListTilePickerItem(
      text: 'TextOverflow.fade',
      value: TextOverflow.fade,
    ),
    ListTilePickerItem(
      text: 'TextOverflow.visible',
      value: TextOverflow.visible,
    ),
  ];
}
