import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class Pad extends StatelessWidget {
  final updateState;

  const Pad({super.key, this.updateState});

  final TextStyle textStyle =
      const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser"),
        Container(
          decoration: BoxDecoration(
              color: Colors.green[200],
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              )),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.green[200],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  )),
              child: Column(children: [
                Text(
                  "Je place un pansement ou un linge propre sur la plaie",
                  style: textStyle,
                ),
                Text(
                  "Je pose un linge ou tout autre liens permettant de serrer ou faire tenir se pansement ou linge",
                  style: textStyle,
                ),
              ])),
        ),
        Image.asset(width: 100, "lib/assets/images/first_aid/pansement.png"),
        TopText("Efficace ?"),
        SingleClickableText("OUI", updateState, "bleeding_stop"),
        SingleClickableText("NON", updateState, "garrot"),
        DoubleBlueClickableText(
            "Saignement Abondant", updateState, "foreign_body"),
      ],
    );
  }
}
