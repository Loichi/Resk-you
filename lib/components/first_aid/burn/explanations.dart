import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';

class Explanations extends StatelessWidget {
  final updateState;

  const Explanations({super.key, this.updateState});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: const [
                Text(
                    "La brulure est une lésion de la peau mais aussi des voies aériennes ou digestives. Il y a les brulures simples et les brulures graves."),
                Text(
                    "Une brulure est dite grave lorsqu'elle présente au moins l'un des caractères suivants :"),
                Text(
                    "-Elle est étendue (plus grande que la moitié de la paume de la main de la victime)"),
                Text("-Elle est noire ou infectée"),
                Text("-Elle est chimique - radiologique ou électrique"),
                Text(
                    "Elle est située près d'un orifice naturel (orifices du visage, organes génitaux, anus..."),
              ],
            )),
        SingleClickableText("Suite", updateState, "severity"),
        const SingleBlueClickableText()
      ],
    );
  }
}
