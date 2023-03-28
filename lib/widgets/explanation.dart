import 'package:flutter/cupertino.dart';

class Explanation extends StatelessWidget {
  const Explanation(this.text, {super.key, this.child});

  final String? text;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: text != null
          ? Text(
              text!,
              style: CupertinoTheme.of(context).textTheme.textStyle,
            )
          : child,
    );
  }
}
