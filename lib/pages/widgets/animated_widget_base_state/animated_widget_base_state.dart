import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

const _code = '''源码
  abstract class AnimatedWidgetBaseState<
    T extends ImplicitlyAnimatedWidget
  > extends ImplicitlyAnimatedWidgetState<T> {
    @override
    void initState() {
      super.initState();
      controller.addListener(_handleAnimationChanged);
    }

    void _handleAnimationChanged() {
      setState(() {
        /// The animation ticked.
        /// Rebuild with new animation value.
      });
    }
  }
''';

class AnimatedWidgetBaseStateScreen extends StatelessWidget {
  const AnimatedWidgetBaseStateScreen({super.key});

  static const routeName = 'widgets/AnimatedWidgetBaseState';
  static const title =
      'AnimatedWidgetBaseState<T extends ImplicitlyAnimatedWidget>';

  @override
  Widget build(BuildContext context) {
    return const PageScaffold(
      title: title,
      explanation: '一个 State 抽象类',
      code: _code,
      inheritance: ListTile(
        name: 'ImplicitlyAnimatedWidgetState<T>',
        routeName: ImplicitlyAnimatedWidgetScreen.routeName,
      ),
      methods: [
        ListTile(
          name: 'initState() → void',
        ),
      ],
    );
  }
}
