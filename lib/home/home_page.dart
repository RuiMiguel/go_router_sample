import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('HOME'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            // TODO (ruimiguel): I want to 'push' here to add settings screen at
            // the top of screens stack but without removing previous history.
            // There is some conflict between home and settings ShellRoutes, it
            // shows all in the same ShellRoute :(
            onPressed: () => context.go('/settings'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTileItem(
              icon: const Icon(Icons.home),
              label: 'News',
              onTap: () {
                _scaffoldKey.currentState?.openEndDrawer();
                context.go('/home');
              },
            ),
            ListTileItem(
              icon: const Icon(Icons.favorite),
              label: 'Favorites',
              onTap: () {
                _scaffoldKey.currentState?.openEndDrawer();
                context.go('/favorites');
              },
            ),
          ],
        ),
      ),
      body: widget.child,
    );
  }
}

class ListTileItem extends ListTile {
  ListTileItem({
    required Widget icon,
    required String label,
    super.onTap,
    super.key,
  }) : super(leading: icon, title: Text(label));
}
