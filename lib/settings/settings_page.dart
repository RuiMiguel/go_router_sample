import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<SettingsPage> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  late final List<NavBarTabItem> tabs;

  // getter that computes the current index from the current location,
  // using the helper method below
  int get _currentIndex =>
      _locationToTabIndex(GoRouterState.of(context).location);

  int _locationToTabIndex(String location) {
    final index =
        tabs.indexWhere((t) => location.startsWith(t.initialLocation));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  // callback used to navigate to the desired tab
  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      // go to the initial location of the selected tab (by index)
      context.go(tabs[tabIndex].initialLocation);
    }
  }

  @override
  void initState() {
    super.initState();
    tabs = const [
      NavBarTabItem(
        initialLocation: '/settings',
        icon: Icon(Icons.home),
        label: 'Settings',
      ),
      NavBarTabItem(
        initialLocation: '/profile',
        icon: Icon(Icons.settings),
        label: 'Profile',
      ),
      NavBarTabItem(
        initialLocation: '/theme',
        icon: Icon(Icons.design_services),
        label: 'Theme',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go('/news');
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SETTINGS'),
          leading: BackButton(
            onPressed: () => context.go('/news'),
          ),
        ),
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: tabs,
          onTap: (index) => _onItemTapped(context, index),
        ),
      ),
    );
  }
}

class NavBarTabItem extends BottomNavigationBarItem {
  const NavBarTabItem({
    required this.initialLocation,
    required super.icon,
    super.label,
  }) : super();

  /// The initial location/path
  final String initialLocation;
}
