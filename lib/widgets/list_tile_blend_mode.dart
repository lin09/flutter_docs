import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileBlendMode extends ListTilePicker<BlendMode> {
  ListTileBlendMode({
    super.key,
    super.value,
    super.name = 'blendMode',
    super.description = '混合模式',
    super.onSelectedItemChanged,
    super.valueWidth,
  }) : super(
          items: _items,
        );

  static final _items = [
    ListTilePickerItem(
      text: 'BlendMode.clear',
      value: BlendMode.clear,
    ),
    ListTilePickerItem(
      text: 'BlendMode.color',
      value: BlendMode.color,
    ),
    ListTilePickerItem(
      text: 'BlendMode.colorBurn',
      value: BlendMode.colorBurn,
    ),
    ListTilePickerItem(
      text: 'BlendMode.colorDodge',
      value: BlendMode.colorDodge,
    ),
    ListTilePickerItem(
      text: 'BlendMode.darken',
      value: BlendMode.darken,
    ),
    ListTilePickerItem(
      text: 'BlendMode.difference',
      value: BlendMode.difference,
    ),
    ListTilePickerItem(
      text: 'BlendMode.dst',
      value: BlendMode.dst,
    ),
    ListTilePickerItem(
      text: 'BlendMode.dstATop',
      value: BlendMode.dstATop,
    ),
    ListTilePickerItem(
      text: 'BlendMode.dstIn',
      value: BlendMode.dstIn,
    ),
    ListTilePickerItem(
      text: 'BlendMode.dstOut',
      value: BlendMode.dstOut,
    ),
    ListTilePickerItem(
      text: 'BlendMode.dstOver',
      value: BlendMode.dstOver,
    ),
    ListTilePickerItem(
      text: 'BlendMode.exclusion',
      value: BlendMode.exclusion,
    ),
    ListTilePickerItem(
      text: 'BlendMode.hardLight',
      value: BlendMode.hardLight,
    ),
    ListTilePickerItem(
      text: 'BlendMode.hue',
      value: BlendMode.hue,
    ),
    ListTilePickerItem(
      text: 'BlendMode.lighten',
      value: BlendMode.lighten,
    ),
    ListTilePickerItem(
      text: 'BlendMode.luminosity',
      value: BlendMode.luminosity,
    ),
    ListTilePickerItem(
      text: 'BlendMode.modulate',
      value: BlendMode.modulate,
    ),
    ListTilePickerItem(
      text: 'BlendMode.multiply',
      value: BlendMode.multiply,
    ),
    ListTilePickerItem(
      text: 'BlendMode.overlay',
      value: BlendMode.overlay,
    ),
    ListTilePickerItem(
      text: 'BlendMode.plus',
      value: BlendMode.plus,
    ),
    ListTilePickerItem(
      text: 'BlendMode.saturation',
      value: BlendMode.saturation,
    ),
    ListTilePickerItem(
      text: 'BlendMode.screen',
      value: BlendMode.screen,
    ),
    ListTilePickerItem(
      text: 'BlendMode.softLight',
      value: BlendMode.softLight,
    ),
    ListTilePickerItem(
      text: 'BlendMode.src',
      value: BlendMode.src,
    ),
    ListTilePickerItem(
      text: 'BlendMode.srcATop',
      value: BlendMode.srcATop,
    ),
    ListTilePickerItem(
      text: 'BlendMode.srcIn',
      value: BlendMode.srcIn,
    ),
    ListTilePickerItem(
      text: 'BlendMode.srcOut',
      value: BlendMode.srcOut,
    ),
    ListTilePickerItem(
      text: 'BlendMode.srcOver',
      value: BlendMode.srcOver,
    ),
    ListTilePickerItem(
      text: 'BlendMode.xor',
      value: BlendMode.xor,
    ),
  ];
}
