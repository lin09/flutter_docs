import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

class NavigatorLink extends TextSpan {
  NavigatorLink({
    String? text,
    required this.context,
    required this.routeName,
    this.arguments,
  }) : super(
          text: text ?? routeName.replaceAll(RegExp(r'.+\/'), ''),
          style: CupertinoTheme.of(context).textTheme.actionTextStyle,
          recognizer: TapGestureRecognizer()
            ..onTap = () => Navigator.of(context).pushNamed(
                  routeName,
                  arguments: arguments,
                ),
        );

  final BuildContext context;
  final String routeName;
  final Object? arguments;
}
