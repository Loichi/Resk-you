import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class VictimeCheck extends StatelessWidget {
  final updateState;

  const VictimeCheck({super.key, this.updateState});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser"),
        Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: const [
                Text(
                  "Observer",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                    "Mettre la personne en position de repos(position qui lui convient le mieux"),
              ],
            )),
        Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: const [
                Text("Posez le plus de question possible"),
                Text("Pour identifier:"),
                SizedBox(height: 10),
                Text("- Des signes(pâleur-sueur-paralysies-autres"),
                Text(
                    "- Comportement(trouble de la parole-fatigue-énervé-autres)"),
                Text("- 1ere fois"),
                Text("- Depuis combien de temps le malaise"),
                Text("- Traitement actuel")
              ],
            )),
        SingleClickableText("SUITE", updateState, "medication_check"),
      ],
    );
  }
}
