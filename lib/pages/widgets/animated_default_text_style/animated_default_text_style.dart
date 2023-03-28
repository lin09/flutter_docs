import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  AnimatedDefaultTextStyle({
    Key? key,
    required Widget child,
    required TextStyle style,
    TextAlign? textAlign,
    bool softWrap = true,
    TextOverflow overflow = TextOverflow.clip,
    int? maxLines,
    TextWidthBasis textWidthBasis =
        TextWidthBasis.parent,
    TextHeightBehavior? textHeightBehavior,
    Curve curve = Curves.linear,
    required Duration duration,
    VoidCallback? onEnd,
  })
''';

class AnimatedDefaultTextStyleScreen extends ConsumerWidget {
  const AnimatedDefaultTextStyleScreen({super.key});

  static const routeName = 'widgets/AnimatedDefaultTextStyle';
  static const title = 'AnimatedDefaultTextStyle';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '动画版本 DefaultTextStyle ，每当给定的样式发生变化时，它会在给定的持'
          '续时间内自动转换默认的文本样式（应用于没有显式样式的后代文本控件的文本样式）。',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileTextStyle(
          name: 'style',
          value: state.style,
          onSelectedItemChanged: notifier.setStyle,
        ),
        ListTileDuration(
          value: state.duration,
          onSelectedItemChanged: notifier.setDuration,
        ),
        ListTileCurve(
          value: state.curve,
          onSelectedItemChanged: notifier.setCurve,
        ),
        ListTileTextAlign(
          value: state.textAlign,
          onSelectedItemChanged: notifier.setTextAlign,
        ),
        const ListTileChild(),
        ListTileSwitch(
            name: 'softWrap',
            description: '是否在换行符处换行',
            value: state.softWrap,
            onChanged: notifier.setSoftWrap),
        ListTileTextOverflow(
          value: state.overflow,
          onSelectedItemChanged: notifier.setOverflow,
        ),
        ListTileMaxLines(
          value: state.maxLines,
          onChanged: notifier.setMaxLines,
        ),
        ListTileTextWidthBasis(
          value: state.textWidthBasis,
          onSelectedItemChanged: notifier.setTextWidthBasis,
        ),
        ListTileTextHeightBehavior(
          value: state.textHeightBehavior,
          onSelectedItemChanged: notifier.setTextHeightBehavior,
        ),
        const ListTile(
          name: 'onEnd',
          description: '动画结束的回调',
          type: 'void Function()',
        ),
      ],
      inheritance: ImplicitlyAnimatedWidgetScreen.routeName,
      properties: const [
        ListTile(
          name: 'child → Widget',
        ),
        ListTile(
          name: 'maxLines → int?',
        ),
        ListTile(
          name: 'overflow → TextOverflow',
        ),
        ListTile(
          name: 'softWrap → bool',
        ),
        ListTile(
          name: 'style → TextStyle',
        ),
        ListTile(
          name: 'textAlign → TextAlign?',
        ),
        ListTile(
          name: 'textHeightBehavior → TextHeightBehavior?',
        ),
        ListTile(
          name: 'textWidthBasis → TextWidthBasis',
        ),
      ],
      methods: const [
        ListTile(
          name:
              'createState() → AnimatedWidgetBaseState<AnimatedDefaultTextStyle>',
        ),
        ListTile(
          name:
              'debugFillProperties(DiagnosticPropertiesBuilder properties) → void',
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
    required this.style,
    required this.duration,
    this.curve = Curves.linear,
    this.textAlign,
    this.softWrap = true,
    this.overflow = TextOverflow.clip,
    this.maxLines,
    this.textWidthBasis = TextWidthBasis.parent,
    this.textHeightBehavior,
  });

  final TextStyle style;
  final Duration duration;
  final Curve curve;
  final TextAlign? textAlign;
  final bool softWrap;
  final TextOverflow overflow;
  final int? maxLines;
  final TextWidthBasis textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;

  _Props.initial()
      : style = const TextStyle(
          color: CupertinoColors.activeBlue,
          fontSize: 14,
        ),
        duration = const Duration(seconds: 1),
        curve = Curves.linear,
        softWrap = true,
        overflow = TextOverflow.clip,
        maxLines = null,
        textWidthBasis = TextWidthBasis.parent,
        textHeightBehavior = null,
        textAlign = null;

  _Props initial() => _Props.initial();

  _Props copyWith({
    TextStyle? style,
    Duration? duration,
    TextAlign? textAlign,
    Curve? curve,
    bool? softWrap,
    TextOverflow? overflow,
    int? maxLines,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
  }) {
    return _Props(
      style: style ?? this.style,
      duration: duration ?? this.duration,
      textAlign: textAlign ?? this.textAlign,
      curve: curve ?? this.curve,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      maxLines: maxLines ?? this.maxLines,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setStyle(TextStyle value) {
    state = state.copyWith(style: value);
  }

  void setDuration(Duration value) {
    state = state.copyWith(duration: value);
  }

  void setTextAlign(TextAlign value) {
    state = state.copyWith(textAlign: value);
  }

  void setCurve(Curve value) {
    state = state.copyWith(curve: value);
  }

  void setSoftWrap(bool value) {
    state = state.copyWith(softWrap: value);
  }

  void setOverflow(TextOverflow value) {
    state = state.copyWith(overflow: value);
  }

  void setMaxLines(int value) {
    state = state.copyWith(maxLines: value);
  }

  void setTextWidthBasis(TextWidthBasis value) {
    state = state.copyWith(textWidthBasis: value);
  }

  void setTextHeightBehavior(TextHeightBehavior value) {
    state = state.copyWith(textHeightBehavior: value);
  }
}

class _Sample extends StatefulWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  State<_Sample> createState() => _SampleState();
}

class _SampleState extends State<_Sample> {
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: 'Animation');
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoTextField(
            prefix: const Text('  动画内容'),
            controller: _textController,
            onChanged: (value) => setState(() {}),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 50),
          child: AnimatedDefaultTextStyle(
            style: state.style,
            duration: state.duration,
            curve: state.curve,
            textAlign: state.textAlign,
            softWrap: state.softWrap,
            overflow: state.overflow,
            maxLines: state.maxLines,
            textWidthBasis: state.textWidthBasis,
            textHeightBehavior: state.textHeightBehavior,
            child: Text(_textController.value.text),
          ),
        ),
      ],
    );
  }
}
