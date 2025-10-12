import 'package:adp_desktop/adp_desktop.dart';

class MenusButtonsPreview extends StatefulWidget {
  const MenusButtonsPreview({super.key});

  @override
  State<MenusButtonsPreview> createState() => _MenusButtonsPreviewState();
}

class _MenusButtonsPreviewState extends State<MenusButtonsPreview> {
  int _currentIndex = 0;
  int _currentIndex2 = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const AdaptivePulldownMenuButton(
          title: 'Pulldown Menu Button',
          items: [
            AdaptivePulldownMenuItem(
              leading: AdaptiveIcon(AdpIcons.folderAdd),
              child: Text('New folder'),
            ),
            AdaptivePulldownMenuItem(
              leading: AdaptiveIcon(AdpIcons.folderOpen),
              child: Text('Open'),
            ),
            AdaptivePulldownMenuItem(
              leading: AdaptiveIcon(AdpIcons.wand),
              child: Text('Open with'),
            ),
            AdaptivePulldownMenuItem(
              leading: AdaptiveIcon(AdpIcons.delete),
              child: Text('Remove'),
              enabled: false, // this will disabled.
            ),
            AdaptivePulldownMenuItem(
              leading: AdaptiveIcon(AdpIcons.phone),
              child: Text('Import from phone ...'),
            ),
            AdaptivePulldownMenuDivider(),
            AdaptivePulldownMenuItem(
              leading: AdaptiveIcon(AdpIcons.star),
              child: Text('Give us a star'),
            ),
          ],
        ),

        AdaptivePulldownMenuButton.singleChoice(
          onSelected: (index, value) {
            setState(() {
              _currentIndex = index;
            });
          },
          title: 'Pulldown SingleChoice Menu Button',
          items: List.generate(
            3,
            (index) => AdaptivePulldownMenuItem(
              enabled: index == _currentIndex,
              child: Text(ThemeMode.values[index].name),
            ),
          ),
        ),
        AdaptivePopupMenuButton<int>(
          value: _currentIndex2,
          onChanged: (value) {
            setState(() {
              _currentIndex2 = value!;
            });
          },
          placeholder: const Text('Popup Menu Button'),
          items: List.generate(
            10,
            (index) => AdaptivePopupMenuItem(
                value: index, child: Text("${index + 1}")),
          ),
        ),
      ],
    );
  }
}
