import 'list_section.dart';

/// [T] : Widget || routeName ， String routeName 。
class Methods<T> extends ListSection<T> {
  const Methods(super.children, {super.key})
      : super(title: '方法 Methods （不包括继承）');
}
