import 'dart:ui';

import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileImageFilter extends ListTilePicker<ImageFilter> {
  ListTileImageFilter({
    super.key,
    super.value,
    super.name = 'filter',
    super.description = '图像滤镜',
    super.onSelectedItemChanged,
    super.valueWidth = 250,
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
      text: 'ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5)',
      value: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
    ),
    ListTilePickerItem(
      text: 'ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0)',
      value: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
    ),
    ListTilePickerItem(
      text: 'ImageFilter.erode(radiusX: 0.1, radiusY: 1.0)',
      value: ImageFilter.erode(radiusX: 0.1, radiusY: 1.0),
    ),
    ListTilePickerItem(
      text: 'ImageFilter.erode(radiusX: 1.0, radiusY: 1.0)',
      value: ImageFilter.erode(radiusX: 1.0, radiusY: 1.0),
    ),
    ListTilePickerItem(
      text: 'ImageFilter.dilate(radiusX: 0.1, radiusY: 1.0)',
      value: ImageFilter.dilate(radiusX: 0.1, radiusY: 1.0),
    ),
    ListTilePickerItem(
      text: 'ImageFilter.dilate(radiusX: 1.0, radiusY: 1.0)',
      value: ImageFilter.dilate(radiusX: 1.0, radiusY: 1.0),
    ),
  ];
}
