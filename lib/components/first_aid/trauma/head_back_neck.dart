import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class HeadBackNeck extends StatelessWidget {
  final updateState;

  const HeadBackNeck({super.key, this.updateState});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser"),

        FractionallySizedBox(
          widthFactor: 0.8,
          child: Container(
              decoration: BoxDecoration(color: Colors.green[100]),
              child: Column(
                children: const [
                  Text("- Maintenir la tête pour ne pas qu'elle bouge"),
                  Text(
                      "En mettant vos mains de chaque côté des oreilles de la victime"),
                ],
              )),
        ),
        // Image
        Image.asset("lib/assets/images/first_aid/trauma.png", width: 150),
        FractionallySizedBox(
          widthFactor: 0.8,
          child: Container(
              decoration: BoxDecoration(color: Colors.green[100]),
              child: Column(
                children: const [
                  Text("- Alerter les secours"),
                  Text("SAMU(15)    Pompier(18/112)"),
                ],
              )),
        ),

        DoubleBlueClickableText(
            "Menu Traumatisme", updateState, "trauma_location"),
      ],
    );
  }
}
