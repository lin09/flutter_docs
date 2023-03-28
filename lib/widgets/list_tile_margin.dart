import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileMargin extends ListTilePicker<EdgeInsetsGeometry> {
  ListTileMargin({
    super.key,
    super.value,
    super.name = 'margin',
    super.description = '外边距',
    super.onSelectedItemChanged,
    super.valueWidth,
  }) : super(
          items: _items,
          header: const Text(
            '下面选项只是例子，并非全部',
            style: TextStyle(
              fontSize: 16,
              color: CupertinoColors.secondaryLabel,
            ),
          ),
        );

  static final _items = [
    ListTilePickerItem(
      text: 'EdgeInsets.zero',
      value: EdgeInsets.zero,
    ),
    ListTilePickerItem(
      text: 'EdgeInsets.only(left: 8)',
      value: const EdgeInsets.only(left: 8),
    ),
    ListTilePickerItem(
      text: 'EdgeInsets.only(left: 16)',
      value: const EdgeInsets.only(left: 16),
    ),
    ListTilePickerItem(
      text: 'EdgeInsets.only(left: 40)',
      value: const EdgeInsets.only(left: 40),
    ),
    ListTilePickerItem(
      text: 'EdgeInsets.only(top: 8)',
      value: const EdgeInsets.only(top: 8),
    ),
    ListTilePickerItem(
      text: 'EdgeInsets.only(top: 16)',
      value: const EdgeInsets.only(top: 16),
    ),
    ListTilePickerItem(
      text: 'EdgeInsets.only(top: 40)',
      value: const EdgeInsets.only(top: 40),
    ),
  ];
}
