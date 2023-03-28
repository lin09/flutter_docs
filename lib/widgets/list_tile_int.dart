import 'package:flutter/cupertino.dart';

import 'list_tile.dart';

class ListTileInt extends ListTile {
  ListTileInt({
    super.key,
    required super.name,
    super.description,
    this.value,
    required this.onChanged,
    this.max = 999999,
    this.min = 0,
    this.step = 1,
  }) : super(
          trailingBuilder: (BuildContext context) => Row(
            children: [
              CupertinoButton.filled(
                padding: const EdgeInsets.all(2),
                minSize: 0,
                borderRadius: BorderRadius.circular(99),
                child: const Icon(CupertinoIcons.minus),
                onPressed: () {
                  int v = value != null ? value - step : 0;
                  onChanged(v > min ? v : min);
                },
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                constraints: const BoxConstraints(minWidth: 70),
                child: Text(
                  '$value',
                  style: CupertinoTheme.of(context).textTheme.textStyle,
                ),
              ),
              CupertinoButton.filled(
                padding: const EdgeInsets.all(2),
                minSize: 0,
                borderRadius: BorderRadius.circular(99),
                child: const Icon(CupertinoIcons.add),
                onPressed: () {
                  int v = value != null ? value + step : 0;
                  onChanged(v < max ? v : min);
                },
              ),
            ],
          ),
        );

  final int step;
  final int max;
  final int min;
  final int? value;
  final ValueChanged<int> onChanged;
}
