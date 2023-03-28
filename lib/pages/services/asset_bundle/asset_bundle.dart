import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
''';

class AssetBundleScreen extends StatelessWidget {
  const AssetBundleScreen({super.key});

  static const routeName = 'services/AssetBundle';
  static const title = 'AssetBundle';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '一个抽象类。应用程序的资源集合。\n\n'
          '与其直接访问 rootBundle 全局静态，不如考虑使用 DefaultAssetBundle.of 获取当前 '
          'BuildContext 的 AssetBundle 。此间接层允许祖先部件在运行时替换不同的 AssetBundle '
          '（例如，用于测试或本地化），而不是直接获取在构建时创建的 rootBundle 。',
      code: _code,
      methods: [
        ListTile(
          name: 'clear() → void',
          description: '清除所有缓存',
        ),
        ListTile(
          name: 'evict(String key) → void',
          description: '清除单条缓存',
        ),
        ListTile(
          name: 'load(String key) → Future<ByteData>',
          description: '加载资源二进制数据流',
        ),
        ListTile(
          name: 'loadBuffer(String key) → Future<ImmutableBuffer>',
          description: '加载资源 ImmutableBuffer',
        ),
        ListTile(
          name: 'loadString(String key, {bool cache = true}) → Future<String>',
          description: '加载资源字符串',
        ),
        ListTile(
          name:
              'loadStructuredData<T>(String key, Future<T> parser(String value)) → Future<T>',
          description: '加载资源自定义解析数据',
        ),
      ],
      implementers: [
        ListTile(
          name: 'CachingAssetBundle',
          description: '',
          routeName: CachingAssetBundleScreen.routeName,
        ),
        ListTile(
          name: 'NetworkAssetBundle',
          description: '',
          routeName: NetworkAssetBundleScreen.routeName,
        ),
      ],
      seeAlso: [
        DefaultAssetBundleScreen.routeName,
        RootBundleScreen.routeName,
      ],
    );
  }
}
