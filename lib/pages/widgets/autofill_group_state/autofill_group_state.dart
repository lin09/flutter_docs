import 'package:flutter/cupertino.dart';
import 'package:flutter_docs/pages.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class AutofillGroupStateScreen extends ConsumerWidget {
  const AutofillGroupStateScreen({super.key});

  static const routeName = 'widgets/AutofillGroupState';
  static const title = 'AutofillGroupState';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const PageScaffold(
      title: title,
      explanation: 'AutofillGroup 状态。\n可以通过 AutofillGroup.of(context) 获得。',
      code: _code,
      inheritance: ListTile(
        name: 'State<AutofillGroup>',
        routeName: StateScreen.routeName,
      ),
      mixedInTypes: [AutofillScopeMixinScreen.routeName],
      properties: [
        ListTile(
          name: 'autofillClients → Iterable<AutofillClient>',
        ),
      ],
      methods: [
        ListTile(
          name: 'build(BuildContext context) → Widget',
        ),
        ListTile(
          name: 'didChangeDependencies() → void',
        ),
        ListTile(
          name: 'dispose() → void',
        ),
        ListTile(
          name: 'getAutofillClient(String autofillId) → AutofillClient?',
        ),
        ListTile(
          name: 'register(AutofillClient client) → void',
        ),
        ListTile(
          name: 'unregister(String autofillId) → void',
        ),
      ],
    );
  }
}
