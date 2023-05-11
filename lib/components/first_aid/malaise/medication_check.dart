import 'package:flutter/material.dart';

import 'package:resk_you_mobile/components/first_aid/fa_components/single_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class MedicationCheck extends StatelessWidget {
  final updateState;

  const MedicationCheck({super.key, this.updateState});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser ? "),
        Container(
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: const [
                Text("- Alerter les secours SAMU(15) Pompier(18/112)"),
                Text(
                    "- Leurs donner l'ensembles des informations récoltées ou vues"),
              ],
            )),
        TopText("La personne réclame son médicament OU du sucre ?"),
        SingleClickableText("OUI", updateState, "with_medication"),
        const SizedBox(height: 10),
        SingleClickableText("NON", updateState, "no_medication"),
        const SizedBox(height: 30),
        const SingleBlueClickableText(),
        const SizedBox(height: 20),
      ],
    );
  }
}
