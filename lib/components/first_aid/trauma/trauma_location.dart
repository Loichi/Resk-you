import 'package:flutter/material.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_blue_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/single_clickable_text.dart';
import 'package:resk_you_mobile/components/first_aid/fa_components/top_text.dart';

class TraumaLocation extends StatelessWidget {
  final updateState;

  const TraumaLocation({super.key, this.updateState});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "La personne se plain d'une douleur des os ou articulations",
          textAlign: TextAlign.center,
        ),
        TopText("La douleur est localisée    Dos-Nuque-Tête ? "),
        SingleClickableText("OUI", updateState, "head_back_neck"),
        SingleClickableText("NON", updateState, "other_trauma"),
        const SingleBlueClickableText(),
      ],
    );
  }
}
