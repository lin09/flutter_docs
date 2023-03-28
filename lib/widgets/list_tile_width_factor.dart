import 'list_tile_double.dart';

class ListTileWidthFactor extends ListTileDouble {
  ListTileWidthFactor({
    super.key,
    super.name = 'widthFactor',
    super.description = '设置宽度为子部件的宽度乘以该系数',
    super.step = 0.5,
    super.max,
    super.min,
    super.value,
    required super.onChanged,
  });
}
