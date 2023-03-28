import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class NetworkAssetBundleScreen extends StatelessWidget {
  const NetworkAssetBundleScreen({super.key});

  static const routeName = 'services/NetworkAssetBundle';
  static const title = 'NetworkAssetBundle';

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
