import 'package:flutter/material.dart';

class SingleClickableText extends StatefulWidget {
  String text;
  final changeState;
  final page;
  SingleClickableText(this.text, this.changeState, this.page, {super.key});

  @override
  SingleClickableTextState createState() => SingleClickableTextState();
}

class SingleClickableTextState extends State<SingleClickableText> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          backgroundColor: Colors.white),
      onPressed: () => widget.changeState(widget.page),
      child: Text(
        widget.text,
        style: const TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
