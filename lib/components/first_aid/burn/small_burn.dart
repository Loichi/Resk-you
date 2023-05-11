import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/double_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class SmallBurn extends StatelessWidget {
  final updateState;

  const SmallBurn({super.key, this.updateState});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopText("Action à réaliser"),
        Container(
            decoration: BoxDecoration(color: Colors.green[100]),
            child: Column(
              children: const [
                Text("Refroidir à l'eau tempérée"),
                Text("Jusque disparition"),
                Text("-Douleur"),
                Text("-Rougeur"),
                Text("Demander si les vaccins sont à jour"),
                Text("-Surveiller (température - rougeur - malaise)"),
                Text("-Couvrir"),
                Text("-Rassurer"),
              ],
            )),
        DoubleBlueClickableText("Menu Brulure", updateState, "explanations")
      ],
    );
  }
}
