import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileBorderRadius extends ListTilePicker<BorderRadius> {
  ListTileBorderRadius({
    super.key,
    super.value,
    super.name = 'borderRadius',
    super.description = '边框半径',
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
      text: 'BorderRadius.zero',
      value: BorderRadius.zero,
    ),
    ListTilePickerItem(
      text: 'BorderRadius.circular(4)',
      value: BorderRadius.circular(4),
    ),
    ListTilePickerItem(
      text: 'BorderRadius.circular(8)',
      value: BorderRadius.circular(8),
    ),
    ListTilePickerItem(
      text: 'BorderRadius.circular(9999)',
      value: BorderRadius.circular(9999),
    ),
    ListTilePickerItem(
      text: 'horizontal left 8',
      value: const BorderRadius.horizontal(left: Radius.circular(8)),
    ),
    ListTilePickerItem(
      text: 'vertical top 8',
      value: const BorderRadius.vertical(top: Radius.circular(8)),
    ),
    ListTilePickerItem(
      text: 'only topLeft 8 bottomRight 8',
      value: const BorderRadius.only(
        topLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
    ),
  ];
}
