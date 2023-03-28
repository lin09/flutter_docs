import 'list_section.dart';

/// [T] : Widget || routeName ， String routeName 。
class Annotations<T> extends ListSection<T> {
  const Annotations(super.children, {super.key})
      : super(title: '注释 Annotations');
}
