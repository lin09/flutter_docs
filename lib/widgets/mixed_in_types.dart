import 'list_section.dart';

/// [T] : Widget || routeName ， String routeName 。
class MixedInTypes<T> extends ListSection<T> {
  const MixedInTypes(super.children, {super.key})
      : super(title: '混合 Mixed in types');
}
