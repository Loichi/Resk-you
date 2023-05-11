import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';

import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class ActionBleeding extends StatelessWidget {
  final updateState;

  const ActionBleeding({super.key, this.updateState});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser"),
        Container(
            decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                )),
            child: Column(
              children: const [
                Text("Maintenir la compression"),
                Text("Surveiller l'arret du saignement"),
                Text("Alerter les secours Samu(15),Pompier(18/112)"),
              ],
            )),
        DoubleBlueClickableText(
            "Saignement Abondant", updateState, "foreign_body"),
      ],
    );
  }
}
