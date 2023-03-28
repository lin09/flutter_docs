import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class AssetBundleImageKeyScreenScreen extends StatelessWidget {
  const AssetBundleImageKeyScreenScreen({super.key});

  static const routeName = 'painting/AssetBundleImageKey';
  static const title = 'AssetBundleImageKey';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '由 AssetImage 或 ExactAssetImage 获得的图像的 key。这用于标识 '
          'imageCache 中的精确资源。',
      code: _code,
      parameters: [
        ListTile(
          name: 'bundle',
          type: 'AssetBundle',
        ),
        ListTile(
          name: 'name',
          type: 'String',
        ),
        ListTile(
          name: 'scale',
          type: 'double',
        ),
      ],
      annotations: [ImmutableConstantScreen.routeName],
      properties: [
        ListTile(
          name: 'bundle → AssetBundle',
        ),
        ListTile(
          name: 'name → String',
        ),
        ListTile(
          name: 'scale → double',
        ),
      ],
    );
  }
}
