import 'package:flutter/material.dart';

class DoubleText extends StatefulWidget {
  final changeState;
  final page;
  String text;
  DoubleText(this.text, this.changeState, this.page, {super.key});

  @override
  DoubleTextState createState() => DoubleTextState();
}

class DoubleTextState extends State<DoubleText> {



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          backgroundColor: Colors.white),
      onPressed: () {
        widget.changeState(widget.page);
      },
      child: Column(
        children: [
          const Text(
            "Pour",
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            widget.text,
            style: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
