import 'package:flutter/cupertino.dart';

import 'list_tile.dart';

class ListTileDouble extends ListTile {
  ListTileDouble({
    super.key,
    required super.name,
    super.description,
    this.value,
    required this.onChanged,
    this.max = double.infinity,
    this.min = 0.0,
    this.step = 1.0,
    this.precision = 2,
  }) : super(
          trailingBuilder: (BuildContext context) => Row(
            children: [
              CupertinoButton.filled(
                padding: const EdgeInsets.all(2),
                minSize: 0,
                borderRadius: BorderRadius.circular(99),
                child: const Icon(CupertinoIcons.minus),
                onPressed: () {
                  double v = value != null ? value - step : 0;
                  onChanged(v > min ? v : min);
                },
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                constraints: const BoxConstraints(minWidth: 70),
                child: Text(
                  value?.toStringAsFixed(precision) ?? 'null',
                  style: CupertinoTheme.of(context).textTheme.textStyle,
                ),
              ),
              CupertinoButton.filled(
                padding: const EdgeInsets.all(2),
                minSize: 0,
                borderRadius: BorderRadius.circular(99),
                child: const Icon(CupertinoIcons.add),
                onPressed: () {
                  double v = value != null ? value + step : 0;
                  onChanged(v < max ? v : max);
                },
              ),
            ],
          ),
        );

  final double step;
  final double max;
  final double min;
  final double? value;
  final int precision;
  final ValueChanged<double> onChanged;
}
