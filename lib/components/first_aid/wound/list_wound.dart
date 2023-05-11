import 'package:flutter/material.dart';

import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

import 'package:resk_you_mobile/components/first_aid/fa_components/single_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';

class ListWound extends StatelessWidget {
  final updateState;

  const ListWound({super.key, this.updateState});

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
                Text(
                    "Une plaie est dite grave losqu'elle présente au moins l'un des caractères suivants :"),
                Text("Elle est profonde"),
                Text(
                    "Elle est étendue (plus grande que la motié de la paume de la main de la victime)"),
                Text(
                    "Elle contient des corp étrangers (verre, terre, débris, ect.)"),
                Text("Elle est infectée"),
                Text(
                    "Elle est située près d'un orifice naturel (orifices du visage, organes génitaux, anus...)"),
                Text("Elle survient chez une victime particulièrement "),
              ],
            )),
        SingleClickableText("SUITE", updateState, "wound_body"),
        const SingleBlueClickableText(),
      ],
    );
  }
}
