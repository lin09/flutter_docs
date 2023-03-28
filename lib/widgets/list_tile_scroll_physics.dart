import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileScrollPhysics extends ListTilePicker<ScrollPhysics> {
  ListTileScrollPhysics({
    super.key,
    super.value,
    super.name = 'physics',
    super.description = '设置滚动',
    super.onSelectedItemChanged,
    super.valueWidth,
  }) : super(
          items: _items,
        );

  static final _items = [
    ListTilePickerItem(
      text: 'AlwaysScrollableScrollPhysics()',
      value: const AlwaysScrollableScrollPhysics(),
    ),
    ListTilePickerItem(
      text: 'BouncingScrollPhysics()',
      value: const BouncingScrollPhysics(),
    ),
    ListTilePickerItem(
      text: 'ClampingScrollPhysics()',
      value: const ClampingScrollPhysics(),
    ),
    ListTilePickerItem(
      text: 'NeverScrollableScrollPhysics()',
      value: const NeverScrollableScrollPhysics(),
    ),
  ];
}
