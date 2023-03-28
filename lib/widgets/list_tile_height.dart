import 'list_tile_double.dart';

class ListTileHeight extends ListTileDouble {
  ListTileHeight({
    super.key,
    super.name = 'height',
    super.description = '高度',
    super.step = 20,
    super.max,
    super.min,
    super.value,
    required super.onChanged,
  });
}
