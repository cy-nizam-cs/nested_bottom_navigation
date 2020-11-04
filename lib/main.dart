import 'package:flutter/material.dart';
import 'package:nested_bottom_navigation/splash.dart';

import 'app.dart';

void main() => runApp(MyApp());

class AppGlobalNavKey {
  static final globalNavigatorKey = GlobalKey<NavigatorState>();
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: AppGlobalNavKey.globalNavigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}
