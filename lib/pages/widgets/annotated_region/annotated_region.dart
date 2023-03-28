import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  AnnotatedRegion(
    // 暂时只学过 SystemUiOverlayStyle 注释
    value: SystemUiOverlayStyle(
      statusBarBrightness: isLight
        ? Brightness.dark
        : Brightness.light,
    ),
    child: Container(
      padding: const EdgeInsets.all(20),
      color: CupertinoColors.activeBlue,
      child: const Text(
        '此区域在系统状态栏下时，会改变系统状态栏主题'
      ),
    ),
  ),
  ...
''';

class AnnotatedRegionScreen extends ConsumerWidget {
  const AnnotatedRegionScreen({super.key});

  static const routeName = 'widgets/AnnotatedRegion';
  static const title = 'AnnotatedRegion<T extends Object>';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: 'AnnotatedRegion 区域经过注释区域时，将注释值应用到注释区域中。',
      navigationBarFixed: false,
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileSwitch(
          name: 'sized',
          description: '如果为 false ，将注释值应用到注释区域中。并使在 '
              'AnnotatedRegion 之前使用注释区域相应的改变无效，AnnotatedRegion 之前无影响。',
          value: state.sized,
          onChanged: notifier.setSized,
        ),
        const ListTile(
          name: 'value',
          description: '区域注释，可以被 Layer.find 检索的值。',
          type: 'T',
        ),
        const ListTileChild(),
      ],
      inheritance: SingleChildRenderObjectWidgetScreen.routeName,
      properties: const [
        ListTile(
          name: 'sized → bool',
        ),
        ListTile(
          name: 'value → T',
        ),
      ],
      methods: const [
        ListTile(
          name: 'createRenderObject(BuildContext context) → RenderObject',
        ),
        ListTile(
          name:
              'updateRenderObject(BuildContext context, covariant RenderAnnotatedRegion<T> renderObject) → void',
        ),
      ],
      seeAlso: const [
        LayerMethodsFindScreen.routeName,
        AnnotatedRegionLayerScreen.routeName,
      ],
    );
  }
}

final _stateProvider = StateNotifierProvider<_State, _Props>((ref) {
  return _State();
});

class _Props {
  _Props({
    this.sized = true,
  });

  final bool sized;

  _Props.initial() : sized = true;

  _Props initial() => _Props.initial();

  _Props copyWith({
    bool? sized,
  }) {
    return _Props(
      sized: sized ?? this.sized,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setSized(bool value) {
    state = state.copyWith(sized: value);
  }
}

class _Sample extends StatelessWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);
    final platformBrightness = MediaQueryData.fromWindow(
      WidgetsBinding.instance.window,
    ).platformBrightness;
    final isLight = platformBrightness == Brightness.light;

    return Column(
      children: [
        AnnotatedRegion(
          sized: state.sized,
          value: SystemUiOverlayStyle(
            statusBarBrightness: isLight ? Brightness.dark : Brightness.light,
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            color: CupertinoColors.activeBlue,
            child: Text(
              '此区域在系统状态栏下时，会改变系统状态栏主题',
              style: theme.textTheme.textStyle,
            ),
          ),
        ),
        AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarBrightness: isLight ? Brightness.light : Brightness.dark,
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            color: theme.barBackgroundColor,
            child: Text(
              '此区域在系统状态栏下时，还原系统状态栏主题',
              style: theme.textTheme.textStyle,
            ),
          ),
        ),
      ],
    );
  }
}
