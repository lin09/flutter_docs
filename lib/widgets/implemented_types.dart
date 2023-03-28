import 'list_section.dart';

/// [T] : Widget || routeName ， String routeName 。
class ImplementedTypes<T> extends ListSection<T> {
  const ImplementedTypes(super.children, {super.key})
      : super(title: '接口实现 implements');
}
