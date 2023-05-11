import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';

import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class Garrot extends StatelessWidget {
  final updateState;

  const Garrot({super.key, this.updateState});

  final TextStyle textStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser"),
        Flexible(
          child: FractionallySizedBox(
            heightFactor: 1,
            widthFactor: 0.9,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("J'allonge la victime", style: textStyle),
                    Text("Je pose un garrot", style: textStyle),
                    Text("Je note l'heure de la pose du garrot",
                        style: textStyle),
                    Text(
                      "Surveiller l'arret du saignement",
                      style: textStyle,
                    ),
                    Text(
                      "Alerter les secours Samu(15) Pompier(18/112)",
                      textAlign: TextAlign.center,
                      style: textStyle,
                    ),
                    Text("Un garrot se pose l'orsque:", style: textStyle),
                    Text("Je dois me libérer", style: textStyle),
                    Text("Présence corps étranger", style: textStyle),
                    Text("Nombreuse victimes", style: textStyle),
                  ],
                )),
          ),
        ),
        Image.asset(
            width: 300, "lib/assets/images/first_aid/saignementUno.jpg"),
        DoubleBlueClickableText(
            "Saignement Abondant", updateState, "foreign_body"),
      ],
    );
  }
}
