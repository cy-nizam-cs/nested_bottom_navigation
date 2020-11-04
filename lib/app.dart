import 'package:draggable_floating_button/draggable_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:nested_bottom_navigation/home.dart';

import 'bottom_navigation.dart';
import 'orio.dart';
import 'tab_navigator.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  TabItem _currentTab = TabItem.home;
  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.red: GlobalKey<NavigatorState>(),
    TabItem.green: GlobalKey<NavigatorState>(),
    TabItem.blue: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        _currentTab == TabItem.home
            ? true
            : !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the Home page
          if (_currentTab != TabItem.home) {
            _navigatorKeys.values.forEach((element) {
              element.currentState.popUntil((route) => route.isFirst);
            });
            // select 'main' tab
            _selectTab(TabItem.home);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: IndexedStack(
          index: _currentTab.index,
            children: <Widget>[
              Home(),
          _buildOffstageNavigator(TabItem.red),
          _buildOffstageNavigator(TabItem.green),
          _buildOffstageNavigator(TabItem.blue),
        ]),
        floatingActionButton: DraggableFloatingActionButton(
          appContext: context,
          onPressed: (){},
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return
      // Offstage(
      // offstage: _currentTab != tabItem,
      // child:
        TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      // ),
    );
  }
}
