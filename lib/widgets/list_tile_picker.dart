import 'package:flutter/cupertino.dart';

import 'list_tile.dart';

class ListTilePickerItem<T> {
  ListTilePickerItem({required this.text, required this.value});

  final String text;
  final T value;
}

class ListTilePicker<T> extends ListTile {
  const ListTilePicker({
    super.key,
    required super.name,
    super.description,
    required this.items,
    this.value,
    this.valueWidth,
    this.onSelectedItemChanged,
    this.header,
  });

  final List<ListTilePickerItem<T>> items;
  final T? value;
  final double? valueWidth;
  final Object? Function(T value)? onSelectedItemChanged;
  final Widget? header;

  @override
  State<ListTilePicker<T>> createState() => ListTilePickerState();
}

class ListTilePickerState<T> extends ListTileState<ListTilePicker<T>> {
  final ValueNotifier<String> _valueText = ValueNotifier('');
  int _index = 0;
  T? _value;

  void _initState() {
    var text = '';
    var value = widget.value;
    var index = widget.items.indexWhere((element) => element.value == value);
    if (index > -1) {
      text = widget.items.elementAt(index).text;
    }

    _valueText.value = text;
    _index = index;
    _value = value;
  }

  @override
  void didUpdateWidget(covariant ListTilePicker<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_value != widget.value) _initState();
  }

  @override
  void initState() {
    _initState();

    super.setTrailing(AnimatedBuilder(
      animation: _valueText,
      builder: (context, child) => Container(
        constraints: BoxConstraints(
          maxWidth: widget.valueWidth ?? double.infinity,
        ),
        alignment: Alignment.centerRight,
        child: Text(
          _valueText.value,
          style: CupertinoTheme.of(context).textTheme.textStyle,
        ),
      ),
    ));

    void onTap() {
      showCupertinoModalPopup(
        context: context,
        builder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              color: CupertinoTheme.of(context).scaffoldBackgroundColor,
              child: SafeArea(
                top: false,
                child: Column(
                  children: [
                    Container(child: widget.header),
                    SizedBox(
                      height: 240,
                      child: CupertinoPicker(
                        scrollController: FixedExtentScrollController(
                          initialItem: _index,
                        ),
                        itemExtent: 40.0,
                        onSelectedItemChanged: (index) {
                          _index = index;
                        },
                        children: [
                          for (var item in widget.items)
                            Container(
                              height: 40.0,
                              alignment: Alignment.center,
                              child: Text(item.text),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ).whenComplete(() {
        var item = widget.items.elementAt(_index);

        if (_value == null || item.value != _value) {
          var res = widget.onSelectedItemChanged?.call(item.value);

          if (res is bool && res == false) return;

          _valueText.value = item.text;
          _value = item.value;
        }
      });
    }

    setOnTap(onTap);

    super.initState();
  }
}
