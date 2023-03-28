import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class CachingAssetBundleScreen extends StatelessWidget {
  const CachingAssetBundleScreen({super.key});

  static const routeName = 'services/CachingAssetBundle';
  static const title = 'CachingAssetBundle';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '...',
      code: _code,
      inheritance: AssetBundleScreen.routeName,
    );
  }
}
