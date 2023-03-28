import 'list_section.dart';

/// [T] : Widget || routeName ， String routeName 。
class Constructors<T> extends ListSection<T> {
  const Constructors(super.children, {super.key})
      : super(title: '构造器 Constructors');
}
