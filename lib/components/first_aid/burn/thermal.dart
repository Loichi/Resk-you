import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class Thermal extends StatelessWidget {
  final updateState;

  const Thermal({super.key, this.updateState});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser"),
        const Text("la brulure est thermique"),
        Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: const [
                Text("Refroidir à l'eau tempérée"),
                Text("-alerter les secours : SAMU(15) Pompier(18/112)"),
                Text("-Suivre leurs instructions"),
                Text("Mettre la victime en position d'attente"),
              ],
            )),

        /// mettre la bonne image !!!!!!!!!
        Image.asset(
          "lib/assets/images/first_aid/malaise.png",
          width: 200,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(color: Colors.green[100]),
          child: Column(
            children: const [
              Text("-Surveiller (température - rougeur - malaise)"),
              Text("-Couvrir"),
              Text("-Rassurer"),
            ],
          ),
        ),
        DoubleBlueClickableText("Menu Brulure", updateState, "explanations")
      ],
    );
  }
}
