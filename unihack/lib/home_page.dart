import 'package:flutter/material.dart';
import 'package:persistent_bottom_bar/persistent_bottom_bar_scaffold.dart';

class HomePage extends StatelessWidget {
  final _tab1navigatorKey = GlobalKey<NavigatorState>();
  final _tab2navigatorKey = GlobalKey<NavigatorState>();
  final _tab3navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return PersistentBottomBarScaffold(
      items: [
        PersistentTabItem(
          tab: TabPage1(),
          icon: Icons.home,
          title: 'Home',
          navigatorkey: _tab1navigatorKey,
        ),
        PersistentTabItem(
          tab: TabPage2(),
          icon: Icons.search,
          title: 'Search',
          navigatorkey: _tab2navigatorKey,
        ),
        PersistentTabItem(
          tab: TabPage3(),
          icon: Icons.person,
          title: 'Profile',
          navigatorkey: _tab3navigatorKey,
        ),
      ],
    );
  }
}

class TabPage1 extends StatelessWidget {
  const TabPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map Page')),
      body: Container(
        width: double.infinity       
      ),
    );
  }
}

class TabPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Routes Page')),
      body: Container(
        width: double.infinity
      ),
    );
  }
}

class TabPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Page')),
      body: Container(
        width: double.infinity
      ),
    );
  }
}
