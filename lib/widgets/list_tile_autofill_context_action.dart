import 'package:flutter/cupertino.dart';

import 'list_tile_picker.dart';

class ListTileAutofillContextAction
    extends ListTilePicker<AutofillContextAction> {
  ListTileAutofillContextAction({
    super.key,
    super.value,
    required super.name,
    required super.description,
    super.onSelectedItemChanged,
    super.valueWidth,
  }) : super(
          items: _items,
        );

  static final _items = [
    ListTilePickerItem(
      text: 'AutofillContextAction.commit',
      value: AutofillContextAction.commit,
    ),
    ListTilePickerItem(
      text: 'AutofillContextAction.cancel',
      value: AutofillContextAction.cancel,
    ),
  ];
}
