import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileBannerLocation extends ListTilePicker<BannerLocation> {
  ListTileBannerLocation({
    super.key,
    super.value,
    super.name = 'location',
    super.description = '位置',
    super.onSelectedItemChanged,
    super.valueWidth,
  }) : super(
          items: _items,
        );

  static final _items = [
    ListTilePickerItem(
      text: 'BannerLocation.topStart',
      value: BannerLocation.topStart,
    ),
    ListTilePickerItem(
      text: 'BannerLocation.topEnd',
      value: BannerLocation.topEnd,
    ),
    ListTilePickerItem(
      text: 'BannerLocation.bottomStart',
      value: BannerLocation.bottomStart,
    ),
    ListTilePickerItem(
      text: 'BannerLocation.bottomEnd',
      value: BannerLocation.bottomEnd,
    ),
  ];
}
