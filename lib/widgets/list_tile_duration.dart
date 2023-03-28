import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileDuration extends ListTilePicker<Duration> {
  ListTileDuration({
    super.key,
    super.value,
    super.name = 'duration',
    super.description = '持续时间。',
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
      text: 'Duration(seconds: 1)',
      value: const Duration(seconds: 1),
    ),
    ListTilePickerItem(
      text: 'Duration(seconds: 2)',
      value: const Duration(seconds: 2),
    ),
    ListTilePickerItem(
      text: 'Duration(seconds: 10)',
      value: const Duration(seconds: 10),
    ),
  ];
}
