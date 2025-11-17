import 'package:adp_desktop/adp_desktop.dart';
import 'package:flutter/material.dart' as m;

class Scaffold extends StatelessWidget {
  const Scaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      appBar: AdaptiveAppBar(title: const Text('appbar')),
      drawer: AdaptiveDrawer(
        child: ListView(
          children: List.generate(labels.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: AdaptiveListTile(
                useBackgroundColor: index == 0,
                leading: AdaptiveIcon(icons[index]),
                title: labels[index],
              ),
            );
          }),
        ),
      ),
      floatingActionButton: m.FloatingActionButton(
        onPressed: () {},
        child: const AdaptiveIcon(AdpIcons.add),
      ),
      body: Center(
        child: AdaptiveButton(
          child: const Text("back"),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }

  List<AdpIcons> get icons {
    return const [
      AdpIcons.home,
      AdpIcons.bookFilled,
      AdpIcons.book,
      AdpIcons.circle,
      AdpIcons.moon,
      AdpIcons.settings,
    ];
  }

  List<Widget> get labels {
    return const [
      Text('Main Home'),
      Text('Series'),
      Text('Movies'),
      Text('Watched'),
      Text('Favorite'),
      Text('Settings'),
    ];
  }
}
