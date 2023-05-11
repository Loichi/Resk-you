import 'package:flutter/material.dart';

class DoubleGreenText extends StatefulWidget {
  String textTop;
  String textBottom;
  DoubleGreenText(this.textTop, this.textBottom, {super.key});

  @override
  DoubleGreenTextState createState() =>
      DoubleGreenTextState();
}

class DoubleGreenTextState extends State<DoubleGreenText> {


  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 0.7,
        child: InkWell(
            onTap: () {
             
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.green[200],
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(2),
                    )),
                child: Column(
                  children: [
                    Text(
                      widget.textTop,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      widget.textBottom,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ))));
  }
}
