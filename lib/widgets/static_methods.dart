import 'list_section.dart';

/// [T] : Widget || routeName ， String routeName 。
class StaticMethods<T> extends ListSection<T> {
  const StaticMethods(super.children, {super.key}) : super(title: '静态函数');
}
