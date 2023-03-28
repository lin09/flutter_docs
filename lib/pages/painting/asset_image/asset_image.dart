import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  AssetImage(
    String assetName,
    {
      AssetBundle? bundle,
      String? package,
    },
  )

  const AssetImage('icons/heart.png', package: 'my_icons')
''';

class AssetImageScreen extends StatelessWidget {
  const AssetImageScreen({super.key});

  static const routeName = 'painting/AssetImage';
  static const title = 'AssetImage';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '根据上下文从 AssetBundle 获取图像。',
      code: _code,
      parameters: [
        ListTile(
          name: 'assetName',
          description: '图像路径',
          type: 'String',
        ),
        ListTile(
          name: 'bundle',
          description: '图像资源',
          type: 'AssetBundle',
        ),
        ListTile(
          name: 'package',
          description: '图像依赖包的名称',
          type: 'String',
        ),
      ],
      inheritance: AssetBundleImageProviderScreen.routeName,
      annotations: [ImmutableConstantScreen.routeName],
      properties: [
        ListTile(
          name: 'assetName → String',
        ),
        ListTile(
          name: 'bundle → AssetBundle?',
        ),
        ListTile(
          name: 'keyName → String',
        ),
        ListTile(
          name: 'package → String?',
        ),
      ],
      methods: [
        ListTile(
          name:
              'obtainKey(ImageConfiguration configuration) → Future<AssetBundleImageKey>',
        ),
      ],
      staticMethods: [
        ListTile(
          name:
              'manifestParser(String? jsonData) → Future<Map<String, List<String>>?>',
        ),
      ],
    );
  }
}
