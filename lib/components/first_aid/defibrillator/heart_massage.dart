import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class HeartMassage extends StatelessWidget {
  final updateState;

  const HeartMassage({super.key, this.updateState});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser"),
        Container(
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: [
                const Text("Continuer le massage cardiaque"),
                const Text(
                    "Continuer de suivre les instructions du défibrillateur qui fera des analyses plusieurs fois avant l'arrié des secours"),
                Text("Suivre les consignes",
                    style: TextStyle(color: Colors.red[700])),
              ],
            )),
        DoubleBlueClickableText(
            "Menu Défibrillateur", updateState, "can_shock"),
      ],
    );
  }
}
