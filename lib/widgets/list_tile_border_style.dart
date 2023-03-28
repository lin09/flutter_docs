import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileBorderStyle extends ListTilePicker<BorderStyle> {
  ListTileBorderStyle({
    super.key,
    super.value,
    super.name = 'style',
    super.description = '边框样式',
    super.onSelectedItemChanged,
    super.valueWidth,
  }) : super(
          items: _items,
        );

  static final _items = [
    ListTilePickerItem(
      text: 'BorderStyle.solid',
      value: BorderStyle.solid,
    ),
    ListTilePickerItem(
      text: 'BorderStyle.none',
      value: BorderStyle.none,
    ),
  ];
}
