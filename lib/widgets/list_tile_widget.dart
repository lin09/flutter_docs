import '../pages.dart';

import 'list_tile.dart';

class ListTileWidget extends ListTile {
  const ListTileWidget({
    super.key,
    required super.name,
    super.description,
  }) : super(
          type: 'Widget',
          routeName: WidgetScreen.routeName,
        );
}
