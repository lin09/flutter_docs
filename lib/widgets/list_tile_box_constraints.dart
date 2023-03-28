import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileBoxConstraints extends ListTilePicker<BoxConstraints> {
  ListTileBoxConstraints({
    super.key,
    super.value,
    required super.name,
    required super.description,
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
      text: 'BoxConstraints()',
      value: const BoxConstraints(),
    ),
    ListTilePickerItem(
      text: 'BoxConstraints(maxWidth: 30)',
      value: const BoxConstraints(maxWidth: 30),
    ),
    ListTilePickerItem(
      text: 'BoxConstraints(maxWidth: 60)',
      value: const BoxConstraints(maxWidth: 60),
    ),
    ListTilePickerItem(
      text: 'BoxConstraints(maxWidth: 90)',
      value: const BoxConstraints(maxWidth: 90),
    ),
    ListTilePickerItem(
      text: 'BoxConstraints(minWidth: 30)',
      value: const BoxConstraints(minWidth: 30),
    ),
    ListTilePickerItem(
      text: 'BoxConstraints(minWidth: 60)',
      value: const BoxConstraints(minWidth: 60),
    ),
    ListTilePickerItem(
      text: 'BoxConstraints(minWidth: 90)',
      value: const BoxConstraints(minWidth: 90),
    ),
    ListTilePickerItem(
      text: 'BoxConstraints(maxHeight: 30)',
      value: const BoxConstraints(maxHeight: 30),
    ),
    ListTilePickerItem(
      text: 'BoxConstraints(maxHeight: 60)',
      value: const BoxConstraints(maxHeight: 60),
    ),
    ListTilePickerItem(
      text: 'BoxConstraints(maxHeight: 90)',
      value: const BoxConstraints(maxHeight: 90),
    ),
    ListTilePickerItem(
      text: 'BoxConstraints(minHeight: 30)',
      value: const BoxConstraints(minHeight: 30),
    ),
    ListTilePickerItem(
      text: 'BoxConstraints(minHeight: 60)',
      value: const BoxConstraints(minHeight: 60),
    ),
    ListTilePickerItem(
      text: 'BoxConstraints(minHeight: 90)',
      value: const BoxConstraints(minHeight: 90),
    ),
    ListTilePickerItem(
      text: 'Width: 10 ~ 60, Height: 10 ~ 60',
      value: const BoxConstraints(
        minWidth: 10,
        maxWidth: 60,
        minHeight: 10,
        maxHeight: 60,
      ),
    ),
  ];
}
