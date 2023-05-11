import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/simple_orange_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class TotalObstruction extends StatelessWidget {
  final updateState;

  const TotalObstruction({super.key, this.updateState});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text("C'est une obstruction totale"),
        const Text(
          "Aucun flux d'air ne sort",
          style: TextStyle(color: Colors.red),
        ),
        TopText("Action à réaliser"),
        SimpleOrangeText("Effectuer 5 claques dans le dos", 18),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset("lib/assets/images/first_aid/chocking.jpg", width: 150),
          Image.asset("lib/assets/images/first_aid/chokingImage2.png",
              width: 100),
        ]),
        TopText("Efficace?"),
        SingleClickableText("Oui", updateState, "look_on"),
        SingleClickableText("Non", updateState, "compression"),
        DoubleBlueClickableText("Menu étouffement", updateState, "can_talk")
      ],
    );
  }
}
