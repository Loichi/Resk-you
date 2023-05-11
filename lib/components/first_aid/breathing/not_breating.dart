import 'package:flutter/material.dart';

import 'package:resk_you_mobile/components/first_aid/fa_components/single_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class NotBreathing extends StatelessWidget {
  final updateState;

  const NotBreathing({super.key, this.updateState});

  final TextStyle textStyle =
      const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser "),
        Flexible(
          child: FractionallySizedBox(
            heightFactor: 0.9,
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
                        Text("Je crie Fort à l'aide !",
                            style: TextStyle(
                                color: Colors.red[600],
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        Text("Pour faire venir une autre personne en renfort",
                            textAlign: TextAlign.center, style: textStyle),
                        Text("J'appel ou je fais appeler les secours:",
                            style: textStyle),
                        Text("SAMU 15 Pompier 15/112", style: textStyle),
                        Text("Je libère les voies aériennes", style: textStyle),
                        Text("Je vais pratiquer un massage cardiaque !",
                            style: TextStyle(
                                color: Colors.red[600],
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                      ])),
            ),
          ),
        ),
        TopText("La perssonne est ?"),
        SingleClickableText("Adulte", updateState, "adult"),
        SingleClickableText("Enfant", updateState, "child"),
        SingleClickableText("Nourrisson", updateState, "baby"),
        const SingleBlueClickableText(),
      ],
    );
  }
}
