import 'list_section.dart';

/// [T] : Widget || routeName ， String routeName 。
class Implementers<T> extends ListSection<T> {
  const Implementers(super.children, {super.key})
      : super(title: '子类 Implementers');
}
