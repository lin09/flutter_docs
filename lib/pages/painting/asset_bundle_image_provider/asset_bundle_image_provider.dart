import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class AssetBundleImageProviderScreen extends StatelessWidget {
  const AssetBundleImageProviderScreen({super.key});

  static const routeName = 'painting/AssetBundleImageProvider';
  static const title = 'AssetBundleImageProvider';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: 'ImageProvider 的一个子抽象类',
      code: _code,
      inheritance: ListTile(
        name: 'ImageProvider<AssetBundleImageKey>',
        routeName: ImageProviderScreen.routeName,
      ),
      methods: [
        ListTile(
          name:
              'load(AssetBundleImageKey key, DecoderCallback decode) → ImageStreamCompleter',
        ),
        ListTile(
          name:
              'loadBuffer(AssetBundleImageKey key, DecoderBufferCallback decode) → ImageStreamCompleter',
        ),
      ],
      implementers: [
        AssetImageScreen.routeName,
        ExactAssetImageScreen.routeName,
      ],
      seeAlso: [
        AssetBundleImageKeyScreenScreen.routeName,
      ],
    );
  }
}
