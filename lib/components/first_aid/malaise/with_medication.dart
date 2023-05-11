import 'package:flutter/material.dart';

import 'package:resk_you_mobile/components/first_aid/fa_components/single_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class WithMedication extends StatelessWidget {
  final updateState;

  const WithMedication({super.key, this.updateState});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText(
          " La personne réclame son médicament OU du sucre",
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: const [
                Text(
                  "Après avis du médecin du SAMU",
                  textAlign: TextAlign.center,
                ),
                Text("- L'aider à prendre son médicament"),
              ],
            )),
        Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: const [
                Text("En attendant les secours"),
                Text("- Surveiller"),
                Text("- Couvrir"),
                Text("- Rassurer"),
              ],
            )),
        const SingleBlueClickableText()
      ],
    );
  }
}
