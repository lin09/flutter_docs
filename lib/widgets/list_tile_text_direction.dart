import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileTextDirection extends ListTilePicker<TextDirection> {
  ListTileTextDirection({
    super.key,
    super.value,
    super.name = 'textDirection',
    super.description = '文字方向',
    super.onSelectedItemChanged,
    super.valueWidth,
  }) : super(
          items: _items,
        );

  static final _items = [
    ListTilePickerItem(
      text: 'TextDirection.ltr',
      value: TextDirection.ltr,
    ),
    ListTilePickerItem(
      text: 'TextDirection.rtl',
      value: TextDirection.rtl,
    ),
  ];
}
