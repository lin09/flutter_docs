import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileBoxShape extends ListTilePicker<BoxShape> {
  ListTileBoxShape({
    super.key,
    super.value,
    super.name = 'shape',
    super.description = '外型',
    super.onSelectedItemChanged,
    super.valueWidth,
  }) : super(
          items: _items,
        );

  static final _items = [
    ListTilePickerItem(
      text: 'BoxShape.rectangle',
      value: BoxShape.rectangle,
    ),
    ListTilePickerItem(
      text: 'BoxShape.circle',
      value: BoxShape.circle,
    ),
  ];
}
