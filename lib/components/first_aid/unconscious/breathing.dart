import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class Breathing extends StatelessWidget {
  final updateState;

  const Breathing({super.key, this.updateState});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      TopText("Action à réaliser "),
      Container(
          decoration: BoxDecoration(color: Colors.green[100]),
          child: Column(
            children: const [
              Text("Je metsla victime en PLS (sur le coté)"),
              Text("J'alerte les secours SAMU(15) Pompier (18/112)"),
            ],
          )),
      Image.asset(
        'lib/assets/images/first_aid/pls.png',
        width: 300,
      ),
      TopText("IMPORTANT !!"),
      FractionallySizedBox(
        widthFactor: 0.8,
        child: Container(
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: const [
                Text("Surveiller en permanence la respiration de la victime"),
                Text(
                    "Si celle-ci s'arrête  alors faire une massage cardiaque voir onglet << Ne respire pas >>"),
              ],
            )),
      ),
      DoubleBlueClickableText(
          "Ne parle pas / Inconscient", updateState, "check"),
    ]);
  }
}
