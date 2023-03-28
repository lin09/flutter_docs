import 'list_tile_double.dart';

class ListTileWidth extends ListTileDouble {
  ListTileWidth({
    super.key,
    super.name = 'width',
    super.description = '宽度',
    super.step = 50,
    super.max,
    super.min,
    super.value,
    required super.onChanged,
  });
}
