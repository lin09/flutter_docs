import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileCurve extends ListTilePicker<Curve> {
  ListTileCurve({
    super.key,
    super.value = Curves.linear,
    super.name = 'curve',
    super.description = '动画曲线',
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
      text: 'Curves.bounceIn',
      value: Curves.bounceIn,
    ),
    ListTilePickerItem(
      text: 'Curves.bounceInOut',
      value: Curves.bounceInOut,
    ),
    ListTilePickerItem(
      text: 'Curves.bounceOut',
      value: Curves.bounceOut,
    ),
    ListTilePickerItem(
      text: 'Curves.decelerate',
      value: Curves.decelerate,
    ),
    ListTilePickerItem(
      text: 'Curves.ease',
      value: Curves.ease,
    ),
    ListTilePickerItem(
      text: 'Curves.easeIn',
      value: Curves.easeIn,
    ),
    ListTilePickerItem(
      text: 'Curves.easeInBack',
      value: Curves.easeInBack,
    ),
    ListTilePickerItem(
      text: 'Curves.easeInCirc',
      value: Curves.easeInCirc,
    ),
    ListTilePickerItem(
      text: 'Curves.easeInCubic',
      value: Curves.easeInCubic,
    ),
    ListTilePickerItem(
      text: 'Curves.easeInExpo',
      value: Curves.easeInExpo,
    ),
    ListTilePickerItem(
      text: 'Curves.easeInOut',
      value: Curves.easeInOut,
    ),
    ListTilePickerItem(
      text: 'Curves.easeInOutBack',
      value: Curves.easeInOutBack,
    ),
    ListTilePickerItem(
      text: 'Curves.easeInOutCirc',
      value: Curves.easeInOutCirc,
    ),
    ListTilePickerItem(
      text: 'Curves.easeInOutCubic',
      value: Curves.easeInOutCubic,
    ),
    ListTilePickerItem(
      text: 'Curves.easeInOutCubicEmphasized',
      value: Curves.easeInOutCubicEmphasized,
    ),
    ListTilePickerItem(
      text: 'Curves.easeInOutExpo',
      value: Curves.easeInOutExpo,
    ),
    ListTilePickerItem(
      text: 'Curves.easeInOutQuad',
      value: Curves.easeInOutQuad,
    ),
    ListTilePickerItem(
      text: 'Curves.easeInOutQuart',
      value: Curves.easeInOutQuart,
    ),
    ListTilePickerItem(
      text: 'Curves.easeInOutQuint',
      value: Curves.easeInOutQuint,
    ),
    ListTilePickerItem(
      text: 'Curves.easeInOutSine',
      value: Curves.easeInOutSine,
    ),
    ListTilePickerItem(
      text: 'Curves.easeInQuad',
      value: Curves.easeInQuad,
    ),
    ListTilePickerItem(
      text: 'Curves.easeInQuart',
      value: Curves.easeInQuart,
    ),
    ListTilePickerItem(
      text: 'Curves.easeInQuint',
      value: Curves.easeInQuint,
    ),
    ListTilePickerItem(
      text: 'Curves.easeInSine',
      value: Curves.easeInSine,
    ),
    ListTilePickerItem(
      text: 'Curves.easeInToLinear',
      value: Curves.easeInToLinear,
    ),
    ListTilePickerItem(
      text: 'Curves.easeOut',
      value: Curves.easeOut,
    ),
    ListTilePickerItem(
      text: 'Curves.easeOutBack',
      value: Curves.easeOutBack,
    ),
    ListTilePickerItem(
      text: 'Curves.easeOutCirc',
      value: Curves.easeOutCirc,
    ),
    ListTilePickerItem(
      text: 'Curves.easeOutCubic',
      value: Curves.easeOutCubic,
    ),
    ListTilePickerItem(
      text: 'Curves.easeOutExpo',
      value: Curves.easeOutExpo,
    ),
    ListTilePickerItem(
      text: 'Curves.easeOutQuad',
      value: Curves.easeOutQuad,
    ),
    ListTilePickerItem(
      text: 'Curves.easeOutQuart',
      value: Curves.easeOutQuart,
    ),
    ListTilePickerItem(
      text: 'Curves.easeOutQuint',
      value: Curves.easeOutQuint,
    ),
    ListTilePickerItem(
      text: 'Curves.easeOutSine',
      value: Curves.easeOutSine,
    ),
    ListTilePickerItem(
      text: 'Curves.elasticIn',
      value: Curves.elasticIn,
    ),
    ListTilePickerItem(
      text: 'Curves.elasticInOut',
      value: Curves.elasticInOut,
    ),
    ListTilePickerItem(
      text: 'Curves.elasticOut',
      value: Curves.elasticOut,
    ),
    ListTilePickerItem(
      text: 'Curves.fastLinearToSlowEaseIn',
      value: Curves.fastLinearToSlowEaseIn,
    ),
    ListTilePickerItem(
      text: 'Curves.fastOutSlowIn',
      value: Curves.fastOutSlowIn,
    ),
    ListTilePickerItem(
      text: 'Curves.linear',
      value: Curves.linear,
    ),
    ListTilePickerItem(
      text: 'Curves.linearToEaseOut',
      value: Curves.linearToEaseOut,
    ),
    ListTilePickerItem(
      text: 'Curves.slowMiddle',
      value: Curves.slowMiddle,
    ),
    ListTilePickerItem(
      text: 'Cubic(0.25, 0.1, 0.25, 1.0)',
      value: const Cubic(0.25, 0.1, 0.25, 1.0),
    ),
  ];
}
