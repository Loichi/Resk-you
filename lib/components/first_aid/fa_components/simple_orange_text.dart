import 'package:flutter/material.dart';

class SimpleOrangeText extends StatelessWidget {
  String text;
  double fontSize;
  SimpleOrangeText(this.text, this.fontSize, {super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: FractionallySizedBox(
            widthFactor: 0.9,
            heightFactor: 0.6,
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(188, 253, 170, 60),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(66, 44, 9, 9),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: Offset(0.0, 1.0),
                    ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            )));
  }
}
