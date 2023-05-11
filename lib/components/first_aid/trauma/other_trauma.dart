import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class OtherTrauma extends StatelessWidget {
  final updateState;

  const OtherTrauma({super.key, this.updateState});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser"),
        Container(
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: const [
                Text(
                    "- Laisser la personne dans la position où elle se sent le mieux"),
                SizedBox(height: 20),
                Text("- Empêcher le membre atteint de bouger"),
              ],
            )),
        Container(
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: const [
                Text("- Alerter les secours"),
                SizedBox(height: 20),
                Text("SAMU(15)    Pompier(18/112)"),
              ],
            )),
        DoubleBlueClickableText(
            "Menu Traumatisme", updateState, "trauma_location"),
      ],
    );
  }
}
