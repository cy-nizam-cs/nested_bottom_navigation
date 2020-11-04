import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nested_bottom_navigation/app.dart';
import 'package:nested_bottom_navigation/main.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            "Splash Screen",
            style: TextStyle(fontSize: 24.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _startTimer() {
    Future.delayed(
      Duration(seconds: 2),
        () => AppGlobalNavKey.globalNavigatorKey.currentState
            .pushReplacement(MaterialPageRoute(builder: (_) => App()))
    );
  }
}
