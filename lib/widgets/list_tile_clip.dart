import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileClip extends ListTilePicker<Clip> {
  ListTileClip({
    super.key,
    super.value,
    super.name = 'clip',
    super.description = '裁剪方式',
    super.onSelectedItemChanged,
    super.valueWidth,
  }) : super(
          items: _items,
        );

  static final _items = [
    ListTilePickerItem(
      text: 'Clip.none',
      value: Clip.none,
    ),
    ListTilePickerItem(
      text: 'Clip.antiAlias',
      value: Clip.antiAlias,
    ),
    ListTilePickerItem(
      text: 'Clip.antiAliasWithSaveLayer',
      value: Clip.antiAliasWithSaveLayer,
    ),
    ListTilePickerItem(
      text: 'Clip.hardEdge',
      value: Clip.hardEdge,
    ),
  ];
}
