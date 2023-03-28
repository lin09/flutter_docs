import 'package:flutter/cupertino.dart';

import 'package:flutter_docs/pages.dart';
import 'package:flutter_docs/widgets.dart';

class PageScaffold extends StatelessWidget {
  /// Object : Widget || String routeName
  const PageScaffold({
    super.key,
    this.navigationBarFixed = true,
    required this.title,
    this.explanation,
    this.explanationChild,
    this.code,
    this.sample,
    this.reset,
    this.parameters,
    this.constructors,
    this.annotations,
    this.inheritance,
    this.mixedInTypes,
    this.implementedTypes,
    this.properties,
    this.methods,
    this.operators,
    this.staticMethods,
    this.constants,
    this.implementers,
    this.mixinApplications,
    this.seeAlso,
  });

  final String title;
  final bool navigationBarFixed;
  final String? explanation;
  final Widget? explanationChild;
  final String? code;
  final Widget? sample;
  final List<Object>? parameters;
  final void Function()? reset;
  final List<Object>? constructors;
  final List<Object>? annotations;
  final Object? inheritance;
  final List<Object>? mixedInTypes;
  final List<Object>? implementedTypes;
  final List<Object>? properties;
  final List<Object>? methods;
  final List<Object>? operators;
  final List<Object>? staticMethods;
  final List<Object>? constants;
  final List<Object>? implementers;
  final List<Object>? mixinApplications;
  final List<Object>? seeAlso;

  bool isListSectionChildren(List<Object>? children) =>
      children?.isNotEmpty ?? false;

  List<Widget> _children(BuildContext context) {
    var theme = CupertinoTheme.of(context);

    List<Widget> result = [];

    if (!navigationBarFixed) {
      result.add(CupertinoNavigationBar(
        middle: Text(title),
        backgroundColor: theme.scaffoldBackgroundColor,
      ));
    }

    if (explanation != null) result.add(Explanation(explanation));

    if (explanationChild != null) {
      result.add(Explanation(
        null,
        child: explanationChild,
      ));
    }

    if (code is String) result.add(CodeView(code!));

    if (sample is Widget) result.add(sample!);

    if (isListSectionChildren(parameters)) {
      result.add(Parameters(parameters, reset: reset));
    }

    if (isListSectionChildren(constructors)) {
      result.add(Constructors(constructors));
    }

    if (isListSectionChildren(annotations)) {
      result.add(
        Annotations(
          [
            for (var item in annotations!)
              item is String
                  ? ListTile(
                      name: '@${item.replaceAll(RegExp(r'.+\/'), '')}',
                      routeName: item,
                    )
                  : item
          ],
        ),
      );
    }

    if (inheritance != null) result.add(Inheritance(inheritance!));

    if (isListSectionChildren(mixedInTypes)) {
      result.add(MixedInTypes(mixedInTypes));
    }

    if (isListSectionChildren(implementedTypes)) {
      result.add(ImplementedTypes(implementedTypes));
    }

    if (isListSectionChildren(properties)) {
      result.add(Properties(properties));
    }

    if (isListSectionChildren(methods)) {
      result.add(Methods(methods));
    }

    if (isListSectionChildren(operators)) {
      result.add(Operators(operators));
    }

    if (isListSectionChildren(staticMethods)) {
      result.add(StaticMethods(staticMethods));
    }

    if (isListSectionChildren(constants)) {
      result.add(Constants(constants));
    }

    if (isListSectionChildren(implementers)) {
      result.add(Implementers(implementers));
    }

    if (isListSectionChildren(mixinApplications)) {
      result.add(MixinApplications(mixinApplications));
    }

    if (isListSectionChildren(seeAlso)) {
      result.add(SeeAlso(seeAlso));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: (navigationBarFixed == true
          ? CupertinoNavigationBar(
              middle: Text(title),
              trailing: CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.search),
                onPressed: () =>
                    Navigator.pushNamed(context, SearchScreen.routeName),
              ),
            )
          : null),
      child: ListView(
        children: _children(context),
      ),
    );
  }
}
