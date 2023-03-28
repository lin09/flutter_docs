import 'list_section.dart';

/// [T] : Widget || routeName ， String routeName 。
class SeeAlso<T> extends ListSection<T> {
  const SeeAlso(super.children, {super.key}) : super(title: 'See also');
}
