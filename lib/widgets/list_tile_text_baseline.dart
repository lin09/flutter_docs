import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileTextBaseline extends ListTilePicker<TextBaseline> {
  ListTileTextBaseline({
    super.key,
    super.value,
    super.name = 'baselineType',
    super.description = '基线类型',
    super.onSelectedItemChanged,
    super.valueWidth,
  }) : super(
          items: _items,
        );

  static final _items = [
    ListTilePickerItem(
      text: 'TextBaseline.alphabetic',
      value: TextBaseline.alphabetic,
    ),
    ListTilePickerItem(
      text: 'TextBaseline.ideographic',
      value: TextBaseline.ideographic,
    ),
  ];
}
