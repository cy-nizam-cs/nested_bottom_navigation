import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(colors: <Color>[
            Colors.white54,
            Colors.blueAccent,
            Colors.white54,
            Colors.blueAccent
          ]),
        ),
        child: Center(
          child: Text(
            "Home Screen",
            style: TextStyle(fontSize: 24.0, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
