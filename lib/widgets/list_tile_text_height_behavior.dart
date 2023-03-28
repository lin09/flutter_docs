import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileTextHeightBehavior extends ListTilePicker<TextHeightBehavior> {
  ListTileTextHeightBehavior({
    super.key,
    super.value,
    super.name = 'textHeightBehavior',
    super.description = '定义如何在文本上方和下方应用 TextStyle.height',
    super.onSelectedItemChanged,
    super.valueWidth,
  }) : super(
          items: _items,
        );

  static final _items = [
    ListTilePickerItem(
      text: 'TextHeightBehavior()',
      value: const TextHeightBehavior(),
    ),
    ListTilePickerItem(
      text: '(applyHeightToFirstAscent: false)',
      value: const TextHeightBehavior(
        applyHeightToFirstAscent: false,
      ),
    ),
    ListTilePickerItem(
      text: '(applyHeightToLastDescent: false)',
      value: const TextHeightBehavior(
        applyHeightToLastDescent: false,
      ),
    ),
    ListTilePickerItem(
      text: '(...: false, ...: false)',
      value: const TextHeightBehavior(
        applyHeightToFirstAscent: false,
        applyHeightToLastDescent: false,
      ),
    ),
    ListTilePickerItem(
      text: '(...even)',
      value: const TextHeightBehavior(
        leadingDistribution: TextLeadingDistribution.even,
      ),
    ),
    ListTilePickerItem(
      text: '(applyHeightToLastDescent: false, ...even)',
      value: const TextHeightBehavior(
        applyHeightToLastDescent: false,
        leadingDistribution: TextLeadingDistribution.even,
      ),
    ),
    ListTilePickerItem(
      text: '(applyHeightToLastDescent: false, ...even)',
      value: const TextHeightBehavior(
        applyHeightToLastDescent: false,
        leadingDistribution: TextLeadingDistribution.even,
      ),
    ),
    ListTilePickerItem(
      text: '(...: false, ...: false, ...even)',
      value: const TextHeightBehavior(
        applyHeightToFirstAscent: false,
        applyHeightToLastDescent: false,
        leadingDistribution: TextLeadingDistribution.even,
      ),
    ),
  ];
}
