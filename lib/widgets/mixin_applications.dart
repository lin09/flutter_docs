import 'list_section.dart';

/// [T] : Widget || routeName ， String routeName 。
class MixinApplications<T> extends ListSection<T> {
  const MixinApplications(super.children, {super.key})
      : super(title: 'Mixin Applications');
}
