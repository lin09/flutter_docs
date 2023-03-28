import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileAxis extends ListTilePicker<Axis> {
  ListTileAxis({
    super.key,
    super.value,
    required super.name,
    required super.description,
    super.onSelectedItemChanged,
    super.valueWidth,
  }) : super(
          items: _items,
        );

  static final _items = [
    ListTilePickerItem(
      text: 'Axis.vertical',
      value: Axis.vertical,
    ),
    ListTilePickerItem(
      text: 'Axis.horizontal',
      value: Axis.horizontal,
    ),
  ];
}
