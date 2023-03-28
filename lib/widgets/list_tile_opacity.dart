import 'list_tile_double.dart';

class ListTileOpacity extends ListTileDouble {
  ListTileOpacity({
    super.key,
    super.name = 'opacity',
    super.description = '透明度',
    required super.value,
    required super.onChanged,
  }) : super(
          max: 1.0,
          step: 0.25,
        );
}
