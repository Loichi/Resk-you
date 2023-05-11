import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';

class AlertOne extends StatelessWidget {
  final updateState;

  const AlertOne({super.key, this.updateState});

  final TextStyle textStyle =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Flexible(
        child: FractionallySizedBox(
          heightFactor: 0.5,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.green[200],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Avant toutes actions",
                    style: textStyle,
                  ),
                  Text(
                    "Ne pas se précipiter",
                    style: textStyle,
                  ),
                  Text(
                    "Prendre l'ensemble des informations nécessaire pour les secours",
                    style: textStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Bien observer la situation",
                    style: textStyle,
                  ),
                ],
              )),
        ),
      ),
      SingleClickableText("SUITE", updateState, "alert2"),
      SingleBlueClickableText(),
    ]);
  }
}
