import 'list_tile_double.dart';

class ListTileHeightFactor extends ListTileDouble {
  ListTileHeightFactor({
    super.key,
    super.name = 'heightFactor',
    super.description = '设置高度为子部件的高度乘以该系数',
    super.step = 0.5,
    super.max,
    super.min,
    super.value,
    required super.onChanged,
  });
}
