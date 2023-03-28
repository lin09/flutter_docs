import 'list_section.dart';

/// [T] : Widget || routeName ， String routeName 。
class Operators<T> extends ListSection<T> {
  const Operators(super.children, {super.key})
      : super(title: '操作 Operators （不包括继承）');
}
