import 'package:flutter/material.dart';

class OrioWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Draggable(
      child: Icon(Icons.chat_rounded),
      feedback: Icon(Icons.chat_rounded),
    );
  }
}
