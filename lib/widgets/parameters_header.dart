import 'package:flutter/cupertino.dart';

class ParametersHeader extends StatelessWidget {
  const ParametersHeader({super.key, this.reset});

  final void Function()? reset;

  static const Widget _title = Text('参数');

  @override
  Widget build(BuildContext context) {
    if (reset == null) return _title;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _title,
        CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          onPressed: reset,
          child: const Text('还原默认值'),
        )
      ],
    );
  }
}
