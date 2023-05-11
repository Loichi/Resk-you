import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';

class SegmentedButton extends StatefulWidget {
  const SegmentedButton({super.key});

  @override
  SegmentedButtonState createState() => SegmentedButtonState();
}

class SegmentedButtonState extends State<SegmentedButton> {
  String selectedSegment = "privé";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: CupertinoSlidingSegmentedControl(
        thumbColor: const Color.fromRGBO(204, 18, 51, 1.000),
        children: {
          'privé': BorderedText(
            strokeColor: Colors.black,
            strokeWidth: 3,
            child: const Text(
              'Vie privée',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          'pro': BorderedText(
            strokeColor: Colors.black,
            strokeWidth: 3,
            child: const Text(
              'Vie pro',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        },
        groupValue: selectedSegment,
        onValueChanged: (value) {
          if (value != null) {
            setState(() {
              selectedSegment = value;
            });
          }
        },
      ),
    );
  }
}
