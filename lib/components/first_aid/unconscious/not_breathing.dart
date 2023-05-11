import 'package:flutter/material.dart';

import 'package:resk_you_mobile/components/first_aid/fa_components/single_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class NotBreathing extends StatelessWidget {
  final updateState;

  const NotBreathing({super.key, this.updateState});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser "),
        const SizedBox(height: 50),
        Container(
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: [
                Text("Je crie Fort à l'aide !",
                    style: TextStyle(color: Colors.red[600])),
                const Text("Pour faire venir une autre personne en renfort"),
                const Text("J'appel ou je fais appeler les secours:"),
                const Text("SAMU 15 Pompier 15/112"),
                const Text("Je libère les voies aériennes"),
                Text("Je vais pratiquer un massage cardiaque !",
                    style: TextStyle(color: Colors.red[600])),
              ],
            )),
        TopText("La perssonne est ?"),
        SingleClickableText("Adulte", updateState, "p"),
        SingleClickableText("Enfant", updateState, "a"),
        SingleClickableText("Nourrisson", updateState, "a"),
        const SingleBlueClickableText(),
      ],
    );
  }
}
