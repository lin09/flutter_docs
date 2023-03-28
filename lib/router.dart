import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';

class AppRouter {
  static Map<String, WidgetBuilder> get appRoutes {
    Map<String, WidgetBuilder> result = {
      SearchScreen.routeName: (context) => const SearchScreen(),
    };

    for (var items in routes.values) {
      for (var routes_ in items) {
        for (var route in routes_.children) {
          result[route.name] = route.builder;
          if (route.children != null) {
            for (var route in route.children!) {
              result[route.name] = route.builder;
            }
          }
        }
      }
    }

    return result;
  }

  static bool hasName(String name) => appRoutes[name] is WidgetBuilder;

  static Map<String, List<AppRoutes>> get routes => {
        'cupertino': cupertino,
        'widgets': widgets,
        'animation': animation,
        'painting': painting,
        'paintingOther': paintingOther,
        'services': services,
        'dartUI': dartUI,
        'meta': meta,
        'other': other,
      };

  static List<AppRoutes> get searchRoutes {
    List<AppRoutes> result = [];

    for (var key in routes.keys) {
      for (var items in routes[key]!) {
        var title = key == 'other'
            ? items.title
            : '${key.replaceAll(RegExp(r'Other$'), '')} - ${items.title}';

        result.add(AppRoutes(
          title: title,
          children: items.children,
        ));
      }
    }

    return result;
  }

  static List<AppRoutes> animation = [
    AppRoutes(
      title: 'CLASSES',
      children: [
        AppRoute(
          name: AlwaysStoppedAnimationScreen.routeName,
          builder: (context) => const AlwaysStoppedAnimationScreen(),
          title: AlwaysStoppedAnimationScreen.title,
          description: '停止的动画',
        ),
        AppRoute(
          name: AnimatableScreen.routeName,
          builder: (context) => const AnimatableScreen(),
          title: AnimatableScreen.title,
          description: '将双精度值映射为特定类型的值',
        ),
        AppRoute(
          name: AnimationScreen.routeName,
          builder: (context) => const AnimationScreen(),
          title: AnimationScreen.title,
          description: '值为 T 类型的动画',
        ),
        AppRoute(
          name: AnimationControllerScreen.routeName,
          builder: (context) => const AnimationControllerScreen(),
          title: AnimationControllerScreen.title,
          description: '控制动画的状态启动、暂停、反向运行等',
        ),
        AppRoute(
          name: AnimationMaxScreen.routeName,
          builder: (context) => const AnimationMaxScreen(),
          title: AnimationMaxScreen.title,
          description: '跟踪2个 Animation<T> ，获取最大 value',
        ),
        AppRoute(
          name: AnimationMeanScreen.routeName,
          builder: (context) => const AnimationMeanScreen(),
          title: AnimationMeanScreen.title,
          description: '跟踪2个Animation<double>，获取平均value值',
        ),
        AppRoute(
          name: AnimationMinScreen.routeName,
          builder: (context) => const AnimationMinScreen(),
          title: AnimationMinScreen.title,
          description: '跟踪2个 Animation<T> ，获取最小 value',
        ),
      ],
    ),
  ];

  static List<AppRoutes> cupertino = [
    AppRoutes(
      title: '颜色',
      children: [
        AppRoute(
          name: CupertinoColorsScreen.routeName,
          builder: (context) => const CupertinoColorsScreen(),
          title: CupertinoColorsScreen.title,
          description: 'IOS 配色',
        ),
      ],
    ),
    AppRoutes(
      title: '图标',
      children: [
        AppRoute(
          name: CupertinoIconsScreen.routeName,
          builder: (context) => const CupertinoIconsScreen(),
          title: CupertinoIconsScreen.title,
          description: 'IOS 图标',
        ),
      ],
    ),
  ];

  static List<AppRoutes> dartUI = [
    AppRoutes(
      title: 'CLASSES',
      children: [
        AppRoute(
          name: RectScreen.routeName,
          builder: (context) => const RectScreen(),
          title: RectScreen.title,
          description: '一种不可变的二维轴对齐浮点矩形',
        ),
        AppRoute(
          name: SizeScreen.routeName,
          builder: (context) => const SizeScreen(),
          title: SizeScreen.title,
          description: '2D 浮点大小',
        ),
      ],
    )
  ];

  static List<AppRoutes> widgets = [
    AppRoutes(
      title: 'CLASSES',
      children: [
        AppRoute(
          name: AbsorbPointerScreen.routeName,
          builder: (context) => const AbsorbPointerScreen(),
          title: AbsorbPointerScreen.title,
          description: '禁止用户交互，不可穿透',
        ),
        AppRoute(
          name: ActionScreen.routeName,
          builder: (context) => const ActionScreen(),
          title: ActionScreen.title,
          description: 'Action<T extends Intent> class',
        ),
        AppRoute(
          name: ActionDispatcherScreen.routeName,
          builder: (context) => const ActionDispatcherScreen(),
          title: ActionDispatcherScreen.title,
          description: 'action 调度器',
        ),
        AppRoute(
          name: ActionListenerScreen.routeName,
          builder: (context) => const ActionListenerScreen(),
          title: ActionListenerScreen.title,
          description: 'action 监听器',
        ),
        AppRoute(
          name: ActionsScreen.routeName,
          builder: (context) => const ActionsScreen(),
          title: ActionsScreen.title,
          description: '集中管理上下文 action',
        ),
        AppRoute(
          name: ActivateActionScreen.routeName,
          builder: (context) => const ActivateActionScreen(),
          title: ActivateActionScreen.title,
          description: '一个 action',
        ),
        AppRoute(
          name: ActivateIntentScreen.routeName,
          builder: (context) => const ActivateIntentScreen(),
          title: ActivateIntentScreen.title,
          description: '一个 intent',
        ),
        AppRoute(
          name: AlignScreen.routeName,
          builder: (context) => const AlignScreen(),
          title: AlignScreen.title,
          description: '对齐部件',
        ),
        AppRoute(
          name: AlignTransitionScreen.routeName,
          builder: (context) => const AlignTransitionScreen(),
          title: AlignTransitionScreen.title,
          description: 'Align 的 Animated 版本',
        ),
        AppRoute(
          name: AlwaysScrollableScrollPhysicsScreen.routeName,
          builder: (context) => const AlwaysScrollableScrollPhysicsScreen(),
          title: AlwaysScrollableScrollPhysicsScreen.title,
          description: '始终可滚动，滚动超出边界有拖拽效果',
        ),
        AppRoute(
          name: AndroidViewScreen.routeName,
          builder: (context) => const AndroidViewScreen(),
          title: AndroidViewScreen.title,
          description: '嵌入 Android 视图',
        ),
        AppRoute(
          name: AndroidViewSurfaceScreen.routeName,
          builder: (context) => const AndroidViewSurfaceScreen(),
          title: AndroidViewSurfaceScreen.title,
          description: '嵌入 Android 视图',
        ),
        AppRoute(
          name: AnimatedAlignScreen.routeName,
          builder: (context) => const AnimatedAlignScreen(),
          title: AnimatedAlignScreen.title,
          description: '动画版本 Align',
        ),
        AppRoute(
          name: AnimatedBuilderScreen.routeName,
          builder: (context) => const AnimatedBuilderScreen(),
          title: AnimatedBuilderScreen.title,
          description: '动画版本 Builder',
        ),
        AppRoute(
          name: AnimatedContainerScreen.routeName,
          builder: (context) => const AnimatedContainerScreen(),
          title: AnimatedContainerScreen.title,
          description: '动画版本 Container',
        ),
        AppRoute(
          name: AnimatedCrossFadeScreen.routeName,
          builder: (context) => const AnimatedCrossFadeScreen(),
          title: AnimatedCrossFadeScreen.title,
          description: '两个子部件交叉淡入淡出',
        ),
        AppRoute(
          name: AnimatedDefaultTextStyleScreen.routeName,
          builder: (context) => const AnimatedDefaultTextStyleScreen(),
          title: AnimatedDefaultTextStyleScreen.title,
          description: '动画版本 DefaultTextStyle',
        ),
        AppRoute(
          name: AnimatedFractionallySizedBoxScreen.routeName,
          builder: (context) => const AnimatedFractionallySizedBoxScreen(),
          title: AnimatedFractionallySizedBoxScreen.title,
          description: '动画版本 FractionallySizedBox',
        ),
        AppRoute(
          name: AnimatedGridScreen.routeName,
          builder: (context) => const AnimatedGridScreen(),
          title: AnimatedGridScreen.title,
          description: '动画版本 Grid',
        ),
        AppRoute(
          name: AnimatedGridStateScreen.routeName,
          builder: (context) => const AnimatedGridStateScreen(),
          title: AnimatedGridStateScreen.title,
          description: 'AnimatedGrid 的 State ，用于插入或移除项目',
        ),
        AppRoute(
          name: AnimatedListScreen.routeName,
          builder: (context) => const AnimatedListScreen(),
          title: AnimatedListScreen.title,
          description: '动画版本 List',
        ),
        AppRoute(
          name: AnimatedListStateScreen.routeName,
          builder: (context) => const AnimatedListStateScreen(),
          title: AnimatedListStateScreen.title,
          description: 'AnimatedList 的 State ，用于插入或移除项目',
        ),
        AppRoute(
          name: AnimatedModalBarrierScreen.routeName,
          builder: (context) => const AnimatedModalBarrierScreen(),
          title: AnimatedModalBarrierScreen.title,
          description: '动画版本 ModalBarrier',
        ),
        AppRoute(
          name: AnimatedOpacityScreen.routeName,
          builder: (context) => const AnimatedOpacityScreen(),
          title: AnimatedOpacityScreen.title,
          description: '动画版本 Opacity',
        ),
        AppRoute(
          name: AnimatedPaddingScreen.routeName,
          builder: (context) => const AnimatedPaddingScreen(),
          title: AnimatedPaddingScreen.title,
          description: '动画版本 Padding',
        ),
        AppRoute(
          name: AnimatedPhysicalModelScreen.routeName,
          builder: (context) => const AnimatedPhysicalModelScreen(),
          title: AnimatedPhysicalModelScreen.title,
          description: '动画版本 PhysicalModel',
        ),
        AppRoute(
          name: AnimatedPositionedScreen.routeName,
          builder: (context) => const AnimatedPositionedScreen(),
          title: AnimatedPositionedScreen.title,
          description: '动画版本 Positioned',
        ),
        AppRoute(
          name: AnimatedPositionedDirectionalScreen.routeName,
          builder: (context) => const AnimatedPositionedDirectionalScreen(),
          title: AnimatedPositionedDirectionalScreen.title,
          description: '动画版本 PositionedDirectional',
        ),
        AppRoute(
          name: AnimatedRotationScreen.routeName,
          builder: (context) => const AnimatedRotationScreen(),
          title: AnimatedRotationScreen.title,
          description: '动画版本 Transform.rotate',
        ),
        AppRoute(
          name: AnimatedScaleScreen.routeName,
          builder: (context) => const AnimatedScaleScreen(),
          title: AnimatedScaleScreen.title,
          description: '动画版本 Transform.scale',
        ),
        AppRoute(
          name: AnimatedSizeScreen.routeName,
          builder: (context) => const AnimatedSizeScreen(),
          title: AnimatedSizeScreen.title,
          description: '大小动画跟随子部件的大小变化',
        ),
        AppRoute(
          name: AnimatedSlideScreen.routeName,
          builder: (context) => const AnimatedSlideScreen(),
          title: AnimatedSlideScreen.title,
          description: '偏移变化动画',
        ),
        AppRoute(
          name: AnimatedSwitcherScreen.routeName,
          builder: (context) => const AnimatedSwitcherScreen(),
          title: AnimatedSwitcherScreen.title,
          description: '新旧子部件交叉淡入淡出',
        ),
        AppRoute(
          name: AnimatedWidgetScreen.routeName,
          builder: (context) => const AnimatedWidgetScreen(),
          title: AnimatedWidgetScreen.title,
          description: '动画的抽象类',
        ),
        AppRoute(
          name: AnimatedWidgetBaseStateScreen.routeName,
          builder: (context) => const AnimatedWidgetBaseStateScreen(),
          title: AnimatedWidgetBaseStateScreen.title,
          description: '一个 State 抽象类',
        ),
        AppRoute(
          name: AnnotatedRegionScreen.routeName,
          builder: (context) => const AnnotatedRegionScreen(),
          title: AnnotatedRegionScreen.title,
          description: '带注释的区域',
        ),
        AppRoute(
          name: AspectRatioScreen.routeName,
          builder: (context) => const AspectRatioScreen(),
          title: AspectRatioScreen.title,
          description: '宽高比',
        ),
        AppRoute(
          name: AsyncSnapshotScreen.routeName,
          builder: (context) => const AsyncSnapshotScreen(),
          title: AsyncSnapshotScreen.title,
          description: '异步快照',
        ),
        AppRoute(
          name: AutocompleteHighlightedOptionScreen.routeName,
          builder: (context) => const AutocompleteHighlightedOptionScreen(),
          title: AutocompleteHighlightedOptionScreen.title,
          description: '上下文高亮索引',
        ),
        AppRoute(
          name: AutocompleteNextOptionIntentScreen.routeName,
          builder: (context) => const AutocompleteNextOptionIntentScreen(),
          title: AutocompleteNextOptionIntentScreen.title,
          description: '一个 Intent',
        ),
        AppRoute(
          name: AutocompletePreviousOptionIntentScreen.routeName,
          builder: (context) => const AutocompletePreviousOptionIntentScreen(),
          title: AutocompletePreviousOptionIntentScreen.title,
          description: '一个 Intent',
        ),
        AppRoute(
          name: AutofillGroupScreen.routeName,
          builder: (context) => const AutofillGroupScreen(),
          title: AutofillGroupScreen.title,
          description: '自动填充分组',
        ),
        AppRoute(
          name: AutofillGroupStateScreen.routeName,
          builder: (context) => const AutofillGroupStateScreen(),
          title: AutofillGroupStateScreen.title,
          description: 'AutofillGroup 状态',
        ),
        AppRoute(
          name: AutomaticKeepAliveScreen.routeName,
          builder: (context) => const AutomaticKeepAliveScreen(),
          title: AutomaticKeepAliveScreen.title,
          description: '允许子部件在惰性列表中保持活性',
        ),
        AppRoute(
          name: BackButtonDispatcherScreen.routeName,
          builder: (context) => const BackButtonDispatcherScreen(),
          title: BackButtonDispatcherScreen.title,
          description: '通过 Router 点击了返回按钮的事件',
        ),
        AppRoute(
          name: BackButtonListenerScreen.routeName,
          builder: (context) => const BackButtonListenerScreen(),
          title: BackButtonListenerScreen.title,
          description: '监听返回按钮的点击事件',
        ),
        AppRoute(
          name: BackdropFilterScreen.routeName,
          builder: (context) => const BackdropFilterScreen(),
          title: BackdropFilterScreen.title,
          description: '背景滤镜',
        ),
        AppRoute(
          name: BallisticScrollActivityScreen.routeName,
          builder: (context) => const BallisticScrollActivityScreen(),
          title: BallisticScrollActivityScreen.title,
          description:
              'An activity that animates a scroll view based on a physics Simulation.',
        ),
        AppRoute(
          name: BannerScreen.routeName,
          builder: (context) => const BannerScreen(),
          title: BannerScreen.title,
          description: '在子部件边角打上标签',
        ),
        AppRoute(
          name: BannerPainterScreen.routeName,
          builder: (context) => const BannerPainterScreen(),
          title: BannerPainterScreen.title,
          description: '标签绘制',
        ),
        AppRoute(
          name: BaselineScreen.routeName,
          builder: (context) => const BaselineScreen(),
          title: BaselineScreen.title,
          description: '基线定位',
        ),
        AppRoute(
          name: BlockSemanticsScreen.routeName,
          builder: (context) => const BlockSemanticsScreen(),
          title: BlockSemanticsScreen.title,
          description: '区块语义',
        ),
        AppRoute(
          name: BorderRadiusTweenScreen.routeName,
          builder: (context) => const BorderRadiusTweenScreen(),
          title: BorderRadiusTweenScreen.title,
          description: '两个边框半径之间的插值',
        ),
      ],
    ),
  ];

  static List<AppRoutes> meta = [
    AppRoutes(
      title: 'CONSTANT',
      children: [
        AppRoute(
          name: ImmutableConstantScreen.routeName,
          builder: (context) => const ImmutableConstantScreen(),
          title: ImmutableConstantScreen.title,
          description: '',
        ),
      ],
    ),
  ];

  static List<AppRoutes> other = [
    AppRoutes(
      title: 'LIBRARIES',
      children: [
        AppRoute(
          name: AnimationsScreen.routeName,
          builder: (context) => const AnimationsScreen(),
          title: AnimationsScreen.title,
          description: 'Flutter 动画系统',
        ),
        AppRoute(
          name: PaintingsScreen.routeName,
          builder: (context) => const PaintingsScreen(),
          title: PaintingsScreen.routeName,
          description: 'Flutter 内置类型和核心代码',
        ),
        AppRoute(
          name: ServicesScreen.routeName,
          builder: (context) => const ServicesScreen(),
          title: ServicesScreen.title,
          description: 'Flutter 服务库',
        ),
      ],
    ),
    AppRoutes(
      title: 'DART',
      children: [
        AppRoute(
          name: DartUIScreen.routeName,
          builder: (context) => const DartUIScreen(),
          title: DartUIScreen.title,
          description: 'Flutter 内置类型和核心代码',
        ),
      ],
    ),
  ];

  static List<AppRoutes> painting = [
    AppRoutes(
      title: 'CLASSES',
      children: [
        AppRoute(
          name: AccumulatorScreen.routeName,
          builder: (context) => const AccumulatorScreen(),
          title: AccumulatorScreen.title,
          description: '累加器',
        ),
        AppRoute(
          name: AlignmentScreen.routeName,
          builder: (context) => const AlignmentScreen(),
          title: AlignmentScreen.title,
          description: '对齐点',
        ),
        AppRoute(
          name: AssetBundleImageKeyScreenScreen.routeName,
          builder: (context) => const AssetBundleImageKeyScreenScreen(),
          title: AssetBundleImageKeyScreenScreen.title,
          description: '图像资源 key',
        ),
        AppRoute(
          name: AssetBundleImageProviderScreen.routeName,
          builder: (context) => const AssetBundleImageProviderScreen(),
          title: AssetBundleImageProviderScreen.title,
          description: 'ImageProvider 的一个子抽象类',
        ),
        AppRoute(
          name: AssetImageScreen.routeName,
          builder: (context) => const AssetImageScreen(),
          title: AssetImageScreen.title,
          description: '根据上下文从 AssetBundle 获取图像',
        ),
        AppRoute(
          name: AutomaticNotchedShapeScreen.routeName,
          builder: (context) => const AutomaticNotchedShapeScreen(),
          title: AutomaticNotchedShapeScreen.title,
          description: '自动凹槽形状',
        ),
        AppRoute(
          name: BeveledRectangleBorderScreen.routeName,
          builder: (context) => const BeveledRectangleBorderScreen(),
          title: BeveledRectangleBorderScreen.title,
          description: '斜角矩形边框',
        ),
        AppRoute(
          name: BorderScreen.routeName,
          builder: (context) => const BorderScreen(),
          title: BorderScreen.title,
          description: '边框',
        ),
        AppRoute(
          name: BorderDirectionalScreen.routeName,
          builder: (context) => const BorderDirectionalScreen(),
          title: BorderDirectionalScreen.title,
          description: '边框，侧面根据阅读方向设置',
        ),
        AppRoute(
          name: BorderRadiusScreen.routeName,
          builder: (context) => const BorderRadiusScreen(),
          title: BorderRadiusScreen.title,
          description: '边框半径',
        ),
        AppRoute(
          name: BorderRadiusDirectionalScreen.routeName,
          builder: (context) => const BorderRadiusDirectionalScreen(),
          title: BorderRadiusDirectionalScreen.title,
          description: '边框半径',
        ),
        AppRoute(
          name: BorderRadiusGeometryScreen.routeName,
          builder: (context) => const BorderRadiusGeometryScreen(),
          title: BorderRadiusGeometryScreen.title,
          description: '边框半径的基础抽象类',
        ),
        AppRoute(
          name: BorderSideScreen.routeName,
          builder: (context) => const BorderSideScreen(),
          title: BorderSideScreen.title,
          description: '边框样式',
        ),
      ],
    ),
  ];

  static List<AppRoutes> paintingOther = [
    AppRoutes(title: 'CONSTRUCTORS', children: [
      AppRoute(
        name: BorderAllScreen.routeName,
        builder: (context) => const BorderAllScreen(),
        title: BorderAllScreen.title,
        description: '统一设置四边边框',
      ),
      AppRoute(
        name: BorderFromBorderSideScreen.routeName,
        builder: (context) => const BorderFromBorderSideScreen(),
        title: BorderFromBorderSideScreen.title,
        description: '通过 BorderSide 统一设置四边边框',
      ),
      AppRoute(
        name: BorderSymmetricScreen.routeName,
        builder: (context) => const BorderSymmetricScreen(),
        title: BorderSymmetricScreen.title,
        description: '分别设置水平方向的边框和垂直方向的边框',
      ),
      AppRoute(
        name: BorderRadiusAllScreen.routeName,
        builder: (context) => const BorderRadiusAllScreen(),
        title: BorderRadiusAllScreen.title,
        description: '创建四角统一的半径',
      ),
      AppRoute(
        name: BorderRadiusCircularScreen.routeName,
        builder: (context) => const BorderRadiusCircularScreen(),
        title: BorderRadiusCircularScreen.title,
        description: '创建四角统一的半径',
      ),
      AppRoute(
        name: BorderRadiusHorizontalScreen.routeName,
        builder: (context) => const BorderRadiusHorizontalScreen(),
        title: BorderRadiusHorizontalScreen.title,
        description: '创建水平对称的半径',
      ),
      AppRoute(
        name: BorderRadiusOnlyScreen.routeName,
        builder: (context) => const BorderRadiusOnlyScreen(),
        title: BorderRadiusOnlyScreen.title,
        description: '创建单独角的四角的半径',
      ),
      AppRoute(
        name: BorderRadiusVerticalScreen.routeName,
        builder: (context) => const BorderRadiusVerticalScreen(),
        title: BorderRadiusVerticalScreen.title,
        description: '创建垂直对称的半径',
      ),
      AppRoute(
        name: BorderRadiusDirectionalAllScreen.routeName,
        builder: (context) => const BorderRadiusDirectionalAllScreen(),
        title: BorderRadiusDirectionalAllScreen.title,
        description: '创建四角统一的半径',
      ),
      AppRoute(
        name: BorderRadiusDirectionalCircularScreen.routeName,
        builder: (context) => const BorderRadiusDirectionalCircularScreen(),
        title: BorderRadiusDirectionalCircularScreen.title,
        description: '创建四角统一的半径',
      ),
      AppRoute(
        name: BorderRadiusDirectionalHorizontalScreen.routeName,
        builder: (context) => const BorderRadiusDirectionalHorizontalScreen(),
        title: BorderRadiusDirectionalHorizontalScreen.title,
        description: '创建阅读方向对称的半径',
      ),
      AppRoute(
        name: BorderRadiusDirectionalOnlyScreen.routeName,
        builder: (context) => const BorderRadiusDirectionalOnlyScreen(),
        title: BorderRadiusDirectionalOnlyScreen.title,
        description: '创建单独角的四角的半径',
      ),
      AppRoute(
        name: BorderRadiusDirectionalVerticalScreen.routeName,
        builder: (context) => const BorderRadiusDirectionalVerticalScreen(),
        title: BorderRadiusDirectionalVerticalScreen.title,
        description: '创建垂直对称的半径',
      ),
    ])
  ];

  static List<AppRoutes> services = [
    AppRoutes(
      title: 'CLASSES',
      children: [
        AppRoute(
          name: AssetBundleScreen.routeName,
          builder: (context) => const AssetBundleScreen(),
          title: AssetBundleScreen.title,
          description: '一个抽象类。应用程序的资源集合',
        ),
        AppRoute(
          name: AutofillHintsScreen.routeName,
          builder: (context) => const AutofillHintsScreen(),
          title: AutofillHintsScreen.title,
          description: '不同平台上常用的自动填表提示字符串的集合',
        ),
      ],
    )
  ];
}

class AppRoutes {
  const AppRoutes({required this.title, required this.children});

  final String title;
  final List<AppRoute> children;
}

class AppRoute {
  const AppRoute({
    required this.name,
    required this.builder,
    required this.title,
    required this.description,
    this.children,
  });

  final String name;
  final WidgetBuilder builder;
  final String title;
  final String description;
  final List<AppRoute>? children;
}
