import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class Shocking extends StatelessWidget {
  final updateState;

  const Shocking({super.key, this.updateState});

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
                Text("Delivrer le choc",
                    style: TextStyle(color: Colors.red[700])),
                const SizedBox(height: 20),
                Text("Laisser l'analyse se faire puis",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.red[700])),
                const Text("Continuer le massage cardiaque"),
                const SizedBox(height: 20),
                const Text(
                    "Continuer de suivre les instructions du défibrillateur qui fera des analyses plusieurs fois avant l'arrié des secours"),
                const SizedBox(
                  height: 30,
                ),
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
