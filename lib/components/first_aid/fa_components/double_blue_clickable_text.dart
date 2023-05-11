import 'package:flutter/material.dart';

class DoubleBlueClickableText extends StatefulWidget {
  String text;
  final changeState;
  final page;
  DoubleBlueClickableText(this.text, this.changeState, this.page, {super.key});

  @override
  DoubleBlueClickableTextState createState() => DoubleBlueClickableTextState();
}

class DoubleBlueClickableTextState extends State<DoubleBlueClickableText> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: Colors.white),
        onPressed: () => widget.changeState(widget.page),
        child: Column(
          children: [
            const Text(
              "Retour",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 65, 131, 255),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              widget.text,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 65, 131, 255),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
