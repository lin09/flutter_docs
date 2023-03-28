import 'package:flutter/cupertino.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

class CodeView extends StatelessWidget {
  const CodeView(this.code, {super.key});

  final String code;

  @override
  Widget build(BuildContext context) {
    return HighlightView(
      code,
      language: 'dart',
      theme: atomOneDarkTheme,
    );
  }
}
