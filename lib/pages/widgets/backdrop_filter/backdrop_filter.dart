import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  Stack(
    alignment: Alignment.center,
    children: [
      SizedBox(
        width: 150,
        child: Text('0' * 98),
      ),
      Center(
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 100,
              child: const Text('高斯模糊'),
            ),
          ),
        ),
      ),
    ],
  ),
''';

class BackdropFilterScreen extends ConsumerWidget {
  const BackdropFilterScreen({super.key});

  static const routeName = 'widgets/BackdropFilter';
  static const title = 'BackdropFilter';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '背景滤镜',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileImageFilter(
          value: state.filter,
          onSelectedItemChanged: notifier.setFilter,
        ),
        ListTileBlendMode(
          value: state.blendMode,
          onSelectedItemChanged: notifier.setBlendMode,
        ),
      ],
      inheritance: SingleChildRenderObjectWidgetScreen.routeName,
      properties: const [
        ListTile(
          name: 'blendMode → BlendMode',
        ),
        ListTile(
          name: 'filter → ImageFilter',
        ),
      ],
      methods: const [
        ListTile(
          name:
              'createRenderObject(BuildContext context) → RenderBackdropFilter',
        ),
        ListTile(
          name:
              'updateRenderObject(BuildContext context, covariant RenderBackdropFilter renderObject) → void',
        ),
      ],
      seeAlso: const [
        ImageFilteredScreen.routeName,
        DecoratedBoxScreen.routeName,
        OpacityScreen.routeName,
      ],
    );
  }
}

class _Sample extends StatefulWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  State<_Sample> createState() => _SampleState();
}

class _SampleState extends State<_Sample> {
  late bool enabled;

  @override
  void initState() {
    enabled = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = widget.state;
    var theme = CupertinoTheme.of(context);
    var children = <Widget>[
      const Image(
        image: NetworkImage(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
        ),
      ),
    ];

    if (enabled) {
      children.add(Center(
        child: ClipRect(
          child: BackdropFilter(
            filter: state.filter,
            blendMode: state.blendMode,
            child: Container(
              alignment: Alignment.center,
              width: 200,
              height: 200,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: CupertinoColors.systemRed,
                child: const Text(
                  '背景滤镜',
                  style: TextStyle(
                    color: CupertinoColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ));
    }

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          color: theme.barBackgroundColor,
          child: Stack(
            alignment: Alignment.center,
            children: children,
          ),
        ),
        CupertinoListTile(
          title: const Text('启用滤镜'),
          trailing: CupertinoSwitch(
            value: enabled,
            onChanged: (value) => setState(() {
              enabled = value;
            }),
          ),
        ),
      ],
    );
  }
}

final _stateProvider = StateNotifierProvider<_State, _Props>((ref) {
  return _State();
});

class _Props {
  _Props({
    required this.filter,
    this.blendMode = BlendMode.srcOver,
  });

  final ImageFilter filter;
  final BlendMode blendMode;

  _Props.initial()
      : filter = ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        blendMode = BlendMode.srcOver;

  _Props initial() => _Props.initial();

  _Props copyWith({
    ImageFilter? filter,
    BlendMode? blendMode,
  }) {
    return _Props(
      filter: filter ?? this.filter,
      blendMode: blendMode ?? this.blendMode,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setFilter(ImageFilter value) {
    state = state.copyWith(filter: value);
  }

  void setBlendMode(BlendMode value) {
    state = state.copyWith(blendMode: value);
  }
}
