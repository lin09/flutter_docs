import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CupertinoColorsScreen extends StatefulWidget {
  const CupertinoColorsScreen({super.key});

  static const routeName = 'cupertino/CupertinoColors';
  static const title = 'CupertinoColors';

  @override
  State<CupertinoColorsScreen> createState() => _CupertinoColorsScreenState();
}

class _CupertinoColorsScreenState extends State<CupertinoColorsScreen> {
  final _sections = <_Section>[
    _Section(
      title: 'Basic Colors',
      colors: {
        'white': CupertinoColors.white,
        'black': CupertinoColors.black,
        'lightBackgroundGray': CupertinoColors.lightBackgroundGray,
        'extraLightBackgroundGray': CupertinoColors.extraLightBackgroundGray,
        'darkBackgroundGray': CupertinoColors.darkBackgroundGray,
        'inactiveGray': CupertinoColors.inactiveGray,
        'destructiveRed': CupertinoColors.destructiveRed,
      },
    ),
    _Section(
      title: 'Active Colors',
      colors: {
        'activeBlue': CupertinoColors.activeBlue,
        'activeGreen': CupertinoColors.activeGreen,
        'activeOrange': CupertinoColors.activeOrange,
      },
    ),
    _Section(
      title: 'System Colors',
      colors: {
        'systemBlue': CupertinoColors.systemBlue,
        'systemGreen': CupertinoColors.systemGreen,
        'systemIndigo': CupertinoColors.systemIndigo,
        'systemOrange': CupertinoColors.systemOrange,
        'systemPink': CupertinoColors.systemPink,
        'systemPurple': CupertinoColors.systemPurple,
        'systemRed': CupertinoColors.systemRed,
        'systemTeal': CupertinoColors.systemTeal,
        'systemYellow': CupertinoColors.systemYellow,
        'systemGrey': CupertinoColors.systemGrey,
        'systemGrey2': CupertinoColors.systemGrey2,
        'systemGrey3': CupertinoColors.systemGrey3,
        'systemGrey4': CupertinoColors.systemGrey4,
        'systemGrey5': CupertinoColors.systemGrey5,
        'systemGrey6': CupertinoColors.systemGrey6,
        'systemFill': CupertinoColors.systemFill,
        'secondarySystemFill': CupertinoColors.secondarySystemFill,
        'tertiarySystemFill': CupertinoColors.tertiarySystemFill,
        'quaternarySystemFill': CupertinoColors.quaternarySystemFill,
      },
    ),
    _Section(
      title: 'Label Colors',
      colors: {
        'label': CupertinoColors.label,
        'secondaryLabel': CupertinoColors.secondaryLabel,
        'tertiaryLabel': CupertinoColors.tertiaryLabel,
        'quaternaryLabel': CupertinoColors.quaternaryLabel,
        'placeholderText': CupertinoColors.placeholderText,
        'separator': CupertinoColors.separator,
        'opaqueSeparator': CupertinoColors.opaqueSeparator,
        'link': CupertinoColors.link,
      },
    ),
    _Section(
      title: 'Background Colors',
      colors: {
        'systemBackground': CupertinoColors.systemBackground,
        'secondarySystemBackground': CupertinoColors.secondarySystemBackground,
        'tertiarySystemBackground': CupertinoColors.tertiarySystemBackground,
        'systemGroupedBackground': CupertinoColors.systemGroupedBackground,
        'secondarySystemGroupedBackground':
            CupertinoColors.secondarySystemGroupedBackground,
        'tertiarySystemGroupedBackground':
            CupertinoColors.tertiarySystemGroupedBackground,
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(CupertinoColorsScreen.title),
        border: null,
      ),
      child: ListView(
        children: [
          for (var section in _sections)
            CupertinoListSection.insetGrouped(
              header: Text(
                section.title,
                style: CupertinoTheme.of(context).textTheme.tabLabelTextStyle,
              ),
              children: [
                for (var key in section.colors.keys)
                  _ListTile(name: key, color: section.colors[key]!),
              ],
            ),
        ],
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  final String name;
  final Color color;
  const _ListTile({required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    var colorHEX = color
        .toString()
        .replaceFirst(RegExp(r'.+0x'), '#')
        .replaceAll(RegExp(r',.+|\)'), '');

    return CupertinoListTile.notched(
      title: Text(colorHEX),
      subtitle: Text(name),
      leading: CupertinoButton(
        color: color,
        child: const Text(''),
        onPressed: () => Clipboard.setData(ClipboardData(text: colorHEX)),
      ),
      trailing: CupertinoButton(
        child: const Icon(CupertinoIcons.doc),
        onPressed: () =>
            Clipboard.setData(ClipboardData(text: 'CupertinoColors.$name')),
      ),
    );
  }
}

class _Section {
  final String title;
  final Map<String, Color> colors;
  _Section({required this.title, required this.colors});
}
