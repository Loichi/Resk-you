import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class Positione extends StatelessWidget {
  final updateState;

  const Positione({super.key, this.updateState});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser ? "),
        Container(
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: const [
                Text("Installer la personne en position d'attente"),
                Text("position adéquat suivant l'endroit de la plaie"),
              ],
            )),
        Image.asset(width: 300, "lib/assets/images/first_aid/plaie.png"),
        Container(
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: const [
                Text("Alerter les secours SAMU (15) Pompier (18/112)"),
                Text("Surveiller (température-rougeur-déformation)"),
                Text("Couvrir"),
                Text("Rassurer"),
              ],
            )),
        DoubleBlueClickableText("Plaie", updateState, "wound_body"),
      ],
    );
  }
}
