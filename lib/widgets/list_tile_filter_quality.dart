import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileFilterQuality extends ListTilePicker<FilterQuality> {
  ListTileFilterQuality({
    super.key,
    super.value,
    super.name = 'filterQuality',
    super.description = '过滤器质量',
    super.onSelectedItemChanged,
    super.valueWidth,
  }) : super(
          items: _items,
        );

  static final _items = [
    ListTilePickerItem(
      text: 'FilterQuality.none',
      value: FilterQuality.none,
    ),
    ListTilePickerItem(
      text: 'FilterQuality.low',
      value: FilterQuality.low,
    ),
    ListTilePickerItem(
      text: 'FilterQuality.medium',
      value: FilterQuality.medium,
    ),
    ListTilePickerItem(
      text: 'FilterQuality.high',
      value: FilterQuality.high,
    ),
  ];
}
