import 'list_section.dart';
import 'parameters_header.dart';

/// [T] : Widget || routeName ， String routeName 。
class Parameters<T> extends ListSection<T> {
  Parameters(super.children, {super.key, void Function()? reset})
      : super(header: ParametersHeader(reset: reset));
}
