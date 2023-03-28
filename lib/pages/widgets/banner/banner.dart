import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  Banner({
    Key? key,
    Widget? child,
    required String message,
    TextDirection? textDirection,
    required BannerLocation location,
    TextDirection? layoutDirection,
    Color color = _kColor,
    TextStyle textStyle = _kTextStyle,
  })
''';

class BannerScreen extends ConsumerWidget {
  const BannerScreen({super.key});

  static const routeName = 'widgets/Banner';
  static const title = 'Banner';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '在子部件边角打上标签',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileBannerLocation(
          value: state.location,
          onSelectedItemChanged: notifier.setLocation,
        ),
        ListTileColor(
          description: '背景颜色',
          value: state.color,
          onSelectedItemChanged: notifier.setColor,
        ),
        ListTileTextDirection(
          value: state.textDirection,
          onSelectedItemChanged: notifier.setTextDirection,
        ),
        ListTileTextDirection(
          name: 'layoutDirection',
          description: '布局方向',
          value: state.layoutDirection,
          onSelectedItemChanged: notifier.setLayoutDirection,
        ),
        const ListTile(
          name: 'message',
          description: '标签的文字',
          type: 'String',
        ),
        const ListTile(
          name: 'textStyle',
          description: '文字样式',
          type: 'TextStyle',
        ),
        const ListTileChild(),
      ],
      inheritance: StatefulWidgetScreen.routeName,
      properties: const [
        ListTile(
          name: 'child → Widget?',
        ),
        ListTile(
          name: 'color → Color',
        ),
        ListTile(
          name: 'layoutDirection → TextDirection?',
        ),
        ListTile(
          name: 'location → BannerLocation',
        ),
        ListTile(
          name: 'message → String',
        ),
        ListTile(
          name: 'textDirection → TextDirection?',
        ),
        ListTile(
          name: 'textStyle → TextStyle',
        ),
      ],
      methods: const [
        ListTile(
          name: 'build(BuildContext context) → Widget',
        ),
        ListTile(
          name:
              'debugFillProperties(DiagnosticPropertiesBuilder properties) → void',
        ),
      ],
      staticMethods: const [],
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
  @override
  Widget build(BuildContext context) {
    final state = widget.state;

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: Banner(
        location: state.location,
        textDirection: state.textDirection,
        layoutDirection: state.layoutDirection,
        color: state.color,
        message: '5.5折',
        child: Container(
          width: 150,
          height: 150,
          color: CupertinoColors.activeOrange,
        ),
      ),
    );
  }
}

final _stateProvider = StateNotifierProvider<_State, _Props>((ref) {
  return _State();
});

class _Props {
  _Props({
    this.textDirection,
    required this.location,
    this.layoutDirection,
    this.color = const Color(0xA0B71C1C),
  });

  final TextDirection? textDirection;
  final BannerLocation location;
  final TextDirection? layoutDirection;
  final Color color;

  _Props.initial()
      : location = BannerLocation.topStart,
        textDirection = null,
        layoutDirection = null,
        color = const Color(0xA0B71C1C);

  _Props initial() => _Props.initial();

  _Props copyWith({
    TextDirection? textDirection,
    BannerLocation? location,
    TextDirection? layoutDirection,
    Color? color,
  }) {
    return _Props(
      textDirection: textDirection ?? this.textDirection,
      location: location ?? this.location,
      layoutDirection: layoutDirection ?? this.layoutDirection,
      color: color ?? this.color,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setTextDirection(TextDirection value) {
    state = state.copyWith(textDirection: value);
  }

  void setLocation(BannerLocation value) {
    state = state.copyWith(location: value);
  }

  void setLayoutDirection(TextDirection value) {
    state = state.copyWith(layoutDirection: value);
  }

  void setColor(Color value) {
    state = state.copyWith(color: value);
  }
}
