import 'package:flutter/cupertino.dart';
import 'package:flutter_docs/pages.dart';

import 'package:flutter_docs/router.dart';
import 'list_section.dart';
import 'list_tile.dart';

class ListPageScaffold extends StatefulWidget {
  const ListPageScaffold({
    super.key,
    required this.title,
    required this.sections,
    this.navigatorState,
    this.isSearch = false,
  });

  final String title;
  final List<AppRoutes> sections;
  final NavigatorState? navigatorState;
  final bool isSearch;

  @override
  State<ListPageScaffold> createState() => _ListPageScaffoldState();
}

class _ListPageScaffoldState extends State<ListPageScaffold> {
  var _sections = <AppRoutes>[];

  onSearch(String keyword) {
    var sections = <AppRoutes>[];

    if (keyword == '') {
      sections = widget.isSearch ? [] : widget.sections;
    } else {
      // 标题从第一个字符匹配到的，排前面
      var sections1 = <AppRoutes>[];
      // 标题包涵到 keyword 排到次位
      var sections2 = <AppRoutes>[];
      // 其它匹配的，排到后面
      var sections3 = <AppRoutes>[];

      keyword = keyword.toLowerCase();

      if (keyword.startsWith('cupertino')) {
        keyword = keyword.substring('cupertino'.length);
      }

      for (var item in widget.sections) {
        // 标题从第一个字符匹配到的，排前面
        var children1 = <AppRoute>[];
        // 标题包涵到 keyword 排到次位
        var children2 = <AppRoute>[];
        // 其它匹配的，排到后面
        var children3 = <AppRoute>[];

        for (var item in item.children) {
          var routeName = item.name.toLowerCase();
          var title = item.title.toLowerCase();
          var description = item.description.toLowerCase();

          if (title.toLowerCase().startsWith(keyword)) {
            children1.add(item);
          } else if (title.toLowerCase().contains(keyword)) {
            children2.add(item);
          } else if (routeName.contains(keyword) ||
              description.contains(keyword)) {
            children3.add(item);
          }
        }

        if (children1.isNotEmpty) {
          sections1.add(AppRoutes(
            title: item.title,
            children: children1,
          ));
        }

        if (children2.isNotEmpty) {
          sections2.add(AppRoutes(
            title: item.title,
            children: children2,
          ));
        }

        if (children3.isNotEmpty) {
          sections3.add(AppRoutes(
            title: item.title,
            children: children3,
          ));
        }
      }

      for (var section in [...sections1, ...sections2, ...sections3]) {
        if (sections.isEmpty) {
          sections.add(section);
        } else {
          var pre = sections[sections.length - 1];
          if (pre.title == section.title) {
            // title 相同，直接添加到子项里
            pre.children.addAll(section.children);
          } else {
            sections.add(section);
          }
        }
      }
    }

    setState(() {
      _sections = sections;
    });
  }

  @override
  void initState() {
    onSearch('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var navigatorState = widget.navigatorState ?? Navigator.of(context);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
        trailing: widget.isSearch
            ? null
            : CupertinoButton(
                padding: EdgeInsets.zero,
                child: const Icon(CupertinoIcons.search),
                onPressed: () =>
                    navigatorState.pushNamed(SearchScreen.routeName),
              ),
      ),
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: CupertinoTheme.of(context).barBackgroundColor,
            child: CupertinoSearchTextField(
              onChanged: onSearch,
              autofocus: widget.isSearch,
            ),
          ),
          for (var item in _sections)
            ListSection(
              title: item.title,
              [
                for (var item in item.children)
                  ListTile(
                    routeName: item.title,
                    description: item.description,
                    onTap: () => navigatorState.pushNamed(item.name),
                  )
              ],
            ),
        ],
      ),
    );
  }
}
