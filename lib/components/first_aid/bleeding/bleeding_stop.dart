import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class BleedingStop extends StatelessWidget {
  final updateState;

  const BleedingStop({super.key, this.updateState});

  final TextStyle textStyle =
      const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser"),
        Flexible(
          child: FractionallySizedBox(
            heightFactor: 0.2,
            widthFactor: 0.9,
            child: Container(
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
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Surveiller l'arret du saignement",
                          style: textStyle,
                        ),
                        Text(
                          "Alerter les pompiers (18/112) ou SAMU(15)",
                          textAlign: TextAlign.center,
                          style: textStyle,
                        ),
                      ])),
            ),
          ),
        ),
        DoubleBlueClickableText(
            "Saignement Abondant", updateState, "foreign_body"),
      ],
    );
  }
}
