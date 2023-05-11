import 'package:flutter/material.dart';

class SimpleButton extends StatefulWidget {
  String text;
  double width;
  double height;
  SimpleButton(this.text, this.width, this.height, {super.key});

  @override
  State<SimpleButton> createState() => SimpleButtonState();
}

class SimpleButtonState extends State<SimpleButton> {
  SimpleButtonState();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(204, 18, 51, 1.000),
          minimumSize: Size(widget.width, widget.height),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      onPressed: () {},
      child: Text(
        widget.text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
