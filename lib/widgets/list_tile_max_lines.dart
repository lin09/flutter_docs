import 'list_tile_int.dart';

class ListTileMaxLines extends ListTileInt {
  ListTileMaxLines({
    super.key,
    super.name = 'maxLines',
    super.description = '最大行数',
    super.max,
    super.value,
    required super.onChanged,
  }) : super(min: 1);
}
