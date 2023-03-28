import 'list_section.dart';

/// [T] : Widget || routeName ， String routeName 。
class Properties<T> extends ListSection<T> {
  const Properties(super.children, {super.key})
      : super(title: '属性 Properties （不包括继承）');
}
