import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileBorderSide extends ListTilePicker<BorderSide> {
  ListTileBorderSide({
    super.key,
    super.value,
    super.name = 'side',
    super.description = '边框样式',
    super.onSelectedItemChanged,
    super.valueWidth = 240,
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

  static final _items = <ListTilePickerItem<BorderSide>>[
    ListTilePickerItem(
      text: 'BorderSide.none',
      value: BorderSide.none,
    ),
    ListTilePickerItem(
      text: 'BorderSide(color: )',
      value: const BorderSide(color: CupertinoColors.activeOrange),
    ),
    ListTilePickerItem(
      text: 'BorderSide(width: 4.0)',
      value: const BorderSide(width: 4.0),
    ),
    ListTilePickerItem(
      text: 'BorderSide(strokeAlign: BorderSide.strokeAlignCenter)',
      value: const BorderSide(strokeAlign: BorderSide.strokeAlignCenter),
    ),
    ListTilePickerItem(
      text: 'BorderSide(strokeAlign: BorderSide.strokeAlignInside)',
      value: const BorderSide(strokeAlign: BorderSide.strokeAlignInside),
    ),
    ListTilePickerItem(
      text: 'BorderSide(strokeAlign: BorderSide.strokeAlignOutside)',
      value: const BorderSide(strokeAlign: BorderSide.strokeAlignOutside),
    ),
    ListTilePickerItem(
      text: 'BorderSide(strokeAlign: -10.0)',
      value: const BorderSide(strokeAlign: -10.0),
    ),
  ];
}
