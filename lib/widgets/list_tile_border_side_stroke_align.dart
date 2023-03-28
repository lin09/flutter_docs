import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileBorderSideStrokeAlign extends ListTilePicker<double> {
  ListTileBorderSideStrokeAlign({
    super.key,
    super.value,
    super.name = 'strokeAlign',
    super.description = '边框在方框边的定位',
    super.onSelectedItemChanged,
    super.valueWidth = 200,
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

  static final _items = <ListTilePickerItem<double>>[
    ListTilePickerItem(
      text: 'BorderSide.strokeAlignCenter',
      value: BorderSide.strokeAlignCenter,
    ),
    ListTilePickerItem(
      text: 'BorderSide.strokeAlignInside',
      value: BorderSide.strokeAlignInside,
    ),
    ListTilePickerItem(
      text: 'BorderSide.strokeAlignOutside',
      value: BorderSide.strokeAlignOutside,
    ),
    ListTilePickerItem(
      text: '-10.0',
      value: -10.0,
    ),
  ];
}
