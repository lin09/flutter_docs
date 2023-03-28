import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''|
  late AnimationController _controller;
  late Animation<BorderRadius?> _radiusTween;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _radiusTween = BorderRadiusTween(
      begin: BorderRadius.circular(0),
      end: BorderRadius.circular(20),
    ).animate(_controller);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  ...
  AnimatedBuilder(
    builder: (BuildContext context, Widget? child) {
      return Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: _radiusTween.value,
          color: CupertinoColors.activeBlue,
        ),
      );
    },
    animation: _controller,
  ),
  ...
''';

class BorderRadiusTweenScreen extends StatelessWidget {
  const BorderRadiusTweenScreen({super.key});

  static const routeName = 'widgets/BorderRadiusTween';
  static const title = 'BorderRadiusTween';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: title,
      explanation: '两个边框半径之间的插值',
      code: _code,
      sample: _Sample(),
      parameters: const [
        ListTile(
          name: 'begin',
          description: '开始插值',
          type: 'BorderRadius',
        ),
        ListTile(
          name: 'end',
          description: '结束插值',
          type: 'BorderRadius',
        ),
      ],
      inheritance: const ListTile(
        name: 'Tween<BorderRadius?>',
        routeName: TweenScreen.routeName,
      ),
      methods: const [
        ListTile(
          name: 'lerp(double t) → BorderRadius?',
        )
      ],
    );
  }
}

class _Sample extends StatefulWidget {
  @override
  State<_Sample> createState() => _SampleState();
}

class _SampleState extends State<_Sample> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<BorderRadius?> _radiusTween;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _radiusTween = BorderRadiusTween(
      begin: BorderRadius.circular(0),
      end: BorderRadius.circular(20),
    ).animate(_controller);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: AnimatedBuilder(
        builder: (BuildContext context, Widget? child) {
          return Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: _radiusTween.value,
              color: CupertinoColors.activeBlue,
            ),
          );
        },
        animation: _controller,
      ),
    );
  }
}
