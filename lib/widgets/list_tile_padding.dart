import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTilePadding extends ListTilePicker<EdgeInsetsGeometry> {
  ListTilePadding({
    super.key,
    super.value,
    super.name = 'padding',
    super.description = '内边距',
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
      text: 'EdgeInsets.all(8)',
      value: const EdgeInsets.all(8),
    ),
    ListTilePickerItem(
      text: 'EdgeInsets.all(16)',
      value: const EdgeInsets.all(16),
    ),
  ];
}
