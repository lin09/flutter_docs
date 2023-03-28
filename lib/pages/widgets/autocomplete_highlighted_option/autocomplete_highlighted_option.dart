import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  AutocompleteHighlightedOption({
    Key? key,
    required ValueNotifier<int> highlightIndexNotifier,
    required Widget child，
  })

  int highlightedIndex = AutocompleteHighlightedOption
    .of(context);
''';

class AutocompleteHighlightedOptionScreen extends ConsumerWidget {
  const AutocompleteHighlightedOptionScreen({super.key});

  static const routeName = 'widgets/AutocompleteHighlightedOption';
  static const title = 'AutocompleteHighlightedOption';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const PageScaffold(
      title: title,
      explanation: '上下文高亮索引',
      code: _code,
      parameters: [
        ListTile(
          name: 'highlightIndexNotifier',
          description: '索引',
          type: 'ValueNotifier<int>',
        ),
        ListTileChild(),
      ],
      inheritance: ListTile(
        name: 'InheritedNotifier<ValueNotifier<int>>',
        routeName: InheritedNotifierScreen.routeName,
      ),
      staticMethods: [
        ListTile(
          name: 'of(BuildContext context) → int',
          description: '返回最近的祖先的高亮选项的索引',
        ),
      ],
    );
  }
}
