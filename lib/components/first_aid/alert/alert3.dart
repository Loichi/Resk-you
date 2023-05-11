import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/simple_orange_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';

class AlertThree extends StatelessWidget {
  final updateState;

  const AlertThree({super.key, this.updateState});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            heightFactor: 0.4,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.green[200],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  )),
              child: const Text("Transmettre les informations suivantes",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        SimpleOrangeText("Mon numéro de téléphone", 18),
        SimpleOrangeText("L'adresse la plus complète possible", 18),
        SimpleOrangeText("Le descriptif de la situation", 18),
        SimpleOrangeText(" Les gestes / actions effectués", 18),
        SingleClickableText("SUITE", updateState, "alert4"),
        DoubleBlueClickableText("Menu l'alerte", updateState, "alert1"),
      ],
    );
  }
}
