import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class NotThermal extends StatelessWidget {
  final updateState;

  const NotThermal({super.key, this.updateState});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser"),
        const Text(
          "La brulure est",
          style: TextStyle(decoration: TextDecoration.underline),
        ),
        const Text("interne ou Chimique OU Radiologique OU électrique"),
        Container(
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: [
                const Text("Refroidir à l'eau tempérée"),
                const Text("-alerter les secours : SAMU(15) Pompier(18/112)"),
                const Text("-Suivre leurs instructions"),
                const Text("Mettre la victime en position d'attente"),

                /// mettre la bonne image !!!!!!!!!
                Image.asset("lib/assets/images/first_aid/malaise.png"),
                const Text("-Surveiller (température - rougeur - malaise)"),
                const Text("-Couvrir"),
                const Text("-Rassurer"),
              ],
            )),
        DoubleBlueClickableText("Menu Brulure", updateState, "explanations")
      ],
    );
  }
}
