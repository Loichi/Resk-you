import 'package:flutter/material.dart';

class TopText extends StatelessWidget {
  String text;

  TopText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 0.7,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            fontSize: 20,
            color: Colors.red[600],
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ));
  }
}
