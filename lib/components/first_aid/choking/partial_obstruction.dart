import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class PartialObstruction extends StatelessWidget {
  final updateState;

  const PartialObstruction({super.key, this.updateState});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: const [
            Text(
              "C'est une obstruction partielle",
              style: TextStyle(fontSize: 14),
            ),
            Text(
              "un flux d'air sort",
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        TopText("Action à réaliser"),
        Container(
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: const [
                Text(
                    "Mettre la personne dans la position la plus confortable pour elle"),
                Text("-Favoriser la toux"),
                Text("-Appeler les secours :"),
                Text("-Samu(15) ou Pompier (18/112)"),
                Text("-Surveiller la personne"),
              ],
            )),
        DoubleBlueClickableText("Menu étouffement", updateState, "can_talk")
      ],
    );
  }
}
