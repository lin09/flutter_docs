import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show FlutterLogo;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  ...
  AnimatedSize(
    duration: state.duration,
    curve: state.curve,
    ...
  ),
  ...
''';

class AnimatedSizeScreen extends ConsumerWidget {
  const AnimatedSizeScreen({super.key});

  static const routeName = 'widgets/AnimatedSize';
  static const title = 'AnimatedSize';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(_stateProvider.notifier);
    final state = ref.watch(_stateProvider);

    return PageScaffold(
      title: title,
      explanation: '每当子部件的大小发生变化时，会在给定的持续时间内自动转换其大小。',
      code: _code,
      sample: _Sample(state),
      reset: notifier.reset,
      parameters: [
        ListTileCurve(
          value: state.curve,
          onSelectedItemChanged: notifier.setCurve,
        ),
        ListTileDuration(
          value: state.duration,
          onSelectedItemChanged: notifier.setDuration,
        ),
        ListTileDuration(
          name: 'reverseDuration',
          description: '没测出效果',
          value: state.reverseDuration,
          onSelectedItemChanged: notifier.setReverseDuration,
        ),
        ListTileAlignment(
          value: state.alignment,
          onSelectedItemChanged: notifier.setAlignment,
        ),
        ListTileClip(
          name: 'clipBehavior',
          value: state.clipBehavior,
          onSelectedItemChanged: notifier.setClipBehavior,
        ),
        const ListTile(
          name: 'onEnd',
          description: '动画结束的回调',
          type: 'void Function()',
        ),
      ],
      inheritance: StatefulWidgetScreen.routeName,
      properties: const [
        ListTile(
          name: 'alignment → AlignmentGeometry',
        ),
        ListTile(
          name: 'child → Widget?',
        ),
        ListTile(
          name: 'clipBehavior → Clip',
        ),
        ListTile(
          name: 'curve → Curve',
        ),
        ListTile(
          name: 'duration → Duration',
        ),
        ListTile(
          name: 'reverseDuration → Duration?',
        ),
      ],
      methods: const [
        ListTile(
          name: 'createState() → State<AnimatedSize>',
        ),
      ],
      seeAlso: const [
        SizeTransitionScreen.routeName,
      ],
    );
  }
}

final _stateProvider = StateNotifierProvider<_State, _Props>((ref) {
  return _State();
});

class _Props {
  _Props({
    required this.duration,
    this.curve = Curves.linear,
    this.alignment = Alignment.center,
    this.reverseDuration,
    this.clipBehavior = Clip.hardEdge,
  });

  final Duration duration;
  final Curve curve;
  final AlignmentGeometry alignment;
  final Duration? reverseDuration;
  final Clip clipBehavior;

  _Props.initial()
      : curve = Curves.linear,
        duration = const Duration(seconds: 1),
        alignment = Alignment.center,
        reverseDuration = null,
        clipBehavior = Clip.hardEdge;

  _Props initial() => _Props.initial();

  _Props copyWith({
    Duration? duration,
    Curve? curve,
    AlignmentGeometry? alignment,
    Duration? reverseDuration,
    Clip? clipBehavior,
  }) {
    return _Props(
      duration: duration ?? this.duration,
      curve: curve ?? this.curve,
      alignment: alignment ?? this.alignment,
      reverseDuration: reverseDuration ?? this.reverseDuration,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }
}

class _State extends StateNotifier<_Props> {
  _State() : super(_Props.initial());

  void reset() {
    state = state.initial();
  }

  void setCurve(Curve value) {
    state = state.copyWith(curve: value);
  }

  void setDuration(Duration value) {
    state = state.copyWith(duration: value);
  }

  void setAlignment(value) {
    state = state.copyWith(alignment: value);
  }

  void setReverseDuration(Duration value) {
    state = state.copyWith(reverseDuration: value);
  }

  void setClipBehavior(Clip value) {
    state = state.copyWith(clipBehavior: value);
  }
}

class _Sample extends StatefulWidget {
  const _Sample(this.state);

  final _Props state;

  @override
  State<_Sample> createState() => _SampleState();
}

class _SampleState extends State<_Sample> {
  late double width;
  late double height;

  @override
  void initState() {
    width = 100.0;
    height = 50.0;
    super.initState();
  }

  void switchSize() {
    setState(() {
      width = width == 100.0 ? 150.0 : 100.0;
      height = height == 50.0 ? 60.0 : 50.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final theme = CupertinoTheme.of(context);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 120,
                child: GestureDetector(
                  onTap: switchSize,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: CupertinoColors.activeBlue,
                    child: AnimatedSize(
                      duration: state.duration,
                      curve: state.curve,
                      alignment: state.alignment,
                      reverseDuration: state.reverseDuration,
                      clipBehavior: state.clipBehavior,
                      child: Container(
                        color: CupertinoColors.activeOrange,
                        width: width,
                        height: height,
                        child: const Text('AnimatedSize child'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 120,
                child: GestureDetector(
                  onTap: switchSize,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: CupertinoColors.activeBlue,
                    child: Column(
                      children: [
                        const Text('Column child'),
                        AnimatedSize(
                          duration: state.duration,
                          curve: state.curve,
                          alignment: state.alignment,
                          reverseDuration: state.reverseDuration,
                          clipBehavior: state.clipBehavior,
                          child: Container(
                            color: CupertinoColors.activeOrange,
                            width: width,
                            height: height,
                            child: const Text('AnimatedSize child'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: Text(
            '左边 AnimatedSize 的父级是 Container 。右边 AnimatedSize 的父级是 '
            'Column ，Column 的父级是 Container 。蓝色写在 Container 上。',
            style: theme.textTheme.actionTextStyle,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 200,
                child: GestureDetector(
                  onTap: switchSize,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: CupertinoColors.activeBlue,
                    child: AnimatedSize(
                      duration: state.duration,
                      curve: state.curve,
                      alignment: state.alignment,
                      reverseDuration: state.reverseDuration,
                      clipBehavior: state.clipBehavior,
                      child: FlutterLogo(size: height),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                height: 200,
                child: GestureDetector(
                  onTap: switchSize,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: CupertinoColors.activeBlue,
                    child: Column(
                      children: [
                        const Text('Column child'),
                        AnimatedSize(
                          duration: state.duration,
                          curve: state.curve,
                          alignment: state.alignment,
                          reverseDuration: state.reverseDuration,
                          clipBehavior: state.clipBehavior,
                          child: FlutterLogo(size: width),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: Text(
            'AnimatedSize 的 child 是 FlutterLogo 时，AnimatedSize 一些属性无效果',
            style: theme.textTheme.actionTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  '切换 AnimatedSize 的 child (Container/FlutterLogo) 的 大小',
                ),
              ),
              CupertinoButton.filled(
                padding: const EdgeInsets.all(10),
                onPressed: switchSize,
                child: const Text('切换'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
